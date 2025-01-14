import os

@available(iOS 13.0, *)
final class MapContentReconciler {
    var content: any MapContent = EmptyMapContent() {
        didSet {
            if isStyleLoaded {
                update(with: content)
            }
        }
    }

    private var isStyleLoaded: Bool = false {
        didSet {
            guard isStyleLoaded != oldValue, isStyleLoaded else {
                return
            }
            reloadStyle(with: content)
        }
    }

    private let context: MapContentNodeContext
    private var root: MapContentNode
    private var loadingToken: AnyCancelable?

    init(styleManager: StyleManagerProtocol, sourceManager: StyleSourceManagerProtocol, styleIsLoaded: Signal<Bool>) {
        self.context = MapContentNodeContext(
            styleManager: styleManager,
            sourceManager: sourceManager,
            isEqualContent: arePropertiesEqual
        )
        let uuidString = UUID().uuidString
        self.root = MapContentNode(id: MapContentNode.ID(anyId: uuidString, stringId: uuidString), context: context)

        loadingToken = styleIsLoaded.assign(to: \.isStyleLoaded, ofWeak: self)
    }

    func setMapContentDependencies(_ dependencies: MapContentDependencies) {
        context.content = dependencies
    }

    private func update(with content: any MapContent) {
        let trace = OSLog.platform.beginInterval("MapContent update")
        defer { trace?.end() }

        context.update(mapContent: content, root: root)
    }

    private func reloadStyle(with content: any MapContent) {
        let trace = OSLog.platform.beginInterval("MapContent update on style reload")
        defer { trace?.end() }

        context.reload(mapContent: content, root: root)
    }
}

@available(iOS 13.0, *)
private extension MapContentNodeContext {
    func update(mapContent: any MapContent, root: MapContentNode) {
        let oldProperties = uniqueProperties
        lastLayerId = nil
        lastImportId = nil
        uniqueProperties = MapContentUniqueProperties()

        mapContent.update(root)

        uniqueProperties.update(
            from: oldProperties,
            style: style.styleManager,
            locationManager: content?.location.value
        )
    }

    func reload(mapContent: any MapContent, root: MapContentNode) {
        lastLayerId = nil

        /// On style reload we need to traverse the whole tree to reconstruct non-persistent layers
        /// On style we need to identifty bottom position in the style in order to stack content above
        /// Position must take into account only non-persistent layers, which was not added in runtime
        isEqualContent = { _, _ in false }
        initialStyleLayers = getInitialStyleLayers() ?? []
        initialStyleImports = style.styleManager.getStyleImports().map(\.id)
        mapContent.update(root)
        isEqualContent = arePropertiesEqual

        uniqueProperties.update(
            from: MapContentUniqueProperties(),
            style: style.styleManager,
            locationManager: content?.location.value
        )
    }

    func getInitialStyleLayers() -> [String]? {
        try? style.styleManager
            .getStyleLayers()
            .filter { try !style.styleManager.isLayerPersistent(for: $0.id) }
            .map { $0.id }
    }
}

private extension StyleManagerProtocol {
    func isLayerPersistent(for layerId: String) throws -> Bool {
        try handleExpected {
            isStyleLayerPersistent(forLayerId: layerId)
        }
    }
}
