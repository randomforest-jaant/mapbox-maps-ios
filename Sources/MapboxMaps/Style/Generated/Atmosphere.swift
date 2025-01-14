// This file is generated.
import UIKit

/// A style's fog property is a global effect that improves depth perception by fading out distant objects.
///
/// - SeeAlso: [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/fog/)
public struct Atmosphere: Codable, Equatable  {

    /// The color of the atmosphere region immediately below the horizon and within the `range` and above the horizon and within `horizon-blend`. Using opacity is recommended only for smoothly transitioning fog on/off as anything less than 100% opacity results in more tiles loaded and drawn.
    public var color: Value<StyleColor>?

    /// Transition property for `color`
    public var colorTransition: StyleTransition?

    /// The color of the atmosphere region above the horizon, `high-color` extends further above the horizon than the `color` property and its spread can be controlled with `horizon-blend`. The opacity can be set to `0` to remove the high atmosphere color contribution.
    public var highColor: Value<StyleColor>?

    /// Transition property for `highColor`
    public var highColorTransition: StyleTransition?

    /// Horizon blend applies a smooth fade from the color of the atmosphere to the color of space. A value of zero leaves a sharp transition from atmosphere to space. Increasing the value blends the color of atmosphere into increasingly high angles of the sky.
    public var horizonBlend: Value<Double>?

    /// Transition property for `horizonBlend`
    public var horizonBlendTransition: StyleTransition?

    /// The start and end distance range in which fog fades from fully transparent to fully opaque. The distance to the point at the center of the map is defined as zero, so that negative range values are closer to the camera, and positive values are farther away.
    public var range: Value<[Double]>?

    /// Transition property for `range`
    public var rangeTransition: StyleTransition?

    /// The color of the region above the horizon and after the end of the `horizon-blend` contribution. The opacity can be set to `0` to have a transparent background.
    public var spaceColor: Value<StyleColor>?

    /// Transition property for `spaceColor`
    public var spaceColorTransition: StyleTransition?

    /// A value controlling the star intensity where `0` will show no stars and `1` will show stars at their maximum intensity.
    public var starIntensity: Value<Double>?

    /// Transition property for `starIntensity`
    public var starIntensityTransition: StyleTransition?

    /// An array of two number values, specifying the vertical range, measured in meters, over which the fog should gradually fade out. When both parameters are set to zero, the fog will be rendered without any vertical constraints.
    public var verticalRange: Value<[Double]>?

    /// Transition property for `verticalRange`
    public var verticalRangeTransition: StyleTransition?

    public init() {}

    enum CodingKeys: String, CodingKey {
        case color = "color"
        case colorTransition = "color-transition"
        case highColor = "high-color"
        case highColorTransition = "high-color-transition"
        case horizonBlend = "horizon-blend"
        case horizonBlendTransition = "horizon-blend-transition"
        case range = "range"
        case rangeTransition = "range-transition"
        case spaceColor = "space-color"
        case spaceColorTransition = "space-color-transition"
        case starIntensity = "star-intensity"
        case starIntensityTransition = "star-intensity-transition"
        case verticalRange = "vertical-range"
        case verticalRangeTransition = "vertical-range-transition"
    }
}


@_spi(Experimental)
@available(iOS 13.0, *)
extension Atmosphere: MapStyleContent, PrimitiveMapContent {
    func visit(_ node: MapContentNode) {
        node.mount(MountedUniqueProperty(keyPath: \.atmosphere, value: self))
    }
}

@_documentation(visibility: public)
extension Atmosphere {
    /// The color of the atmosphere region immediately below the horizon and within the `range` and above the horizon and within `horizon-blend`. Using opacity is recommended only for smoothly transitioning fog on/off as anything less than 100% opacity results in more tiles loaded and drawn.
    @_documentation(visibility: public)
    public func color(_ constant: StyleColor) -> Self {
        with(self, setter(\.color, .constant(constant)))
    }

    /// The color of the atmosphere region immediately below the horizon and within the `range` and above the horizon and within `horizon-blend`. Using opacity is recommended only for smoothly transitioning fog on/off as anything less than 100% opacity results in more tiles loaded and drawn.
    @_documentation(visibility: public)
    public func color(_ color: UIColor) -> Self {
        with(self, setter(\.color, .constant(StyleColor(color))))
    }

    /// Transition property for `color`
    @_documentation(visibility: public)
    public func colorTransition(_ transition: StyleTransition) -> Self {
        with(self, setter(\.colorTransition, transition))
    }

    /// The color of the atmosphere region immediately below the horizon and within the `range` and above the horizon and within `horizon-blend`. Using opacity is recommended only for smoothly transitioning fog on/off as anything less than 100% opacity results in more tiles loaded and drawn.
    @_documentation(visibility: public)
    public func color(_ expression: Expression) -> Self {
        with(self, setter(\.color, .expression(expression)))
    }


    /// The color of the atmosphere region above the horizon, `high-color` extends further above the horizon than the `color` property and its spread can be controlled with `horizon-blend`. The opacity can be set to `0` to remove the high atmosphere color contribution.
    @_documentation(visibility: public)
    public func highColor(_ constant: StyleColor) -> Self {
        with(self, setter(\.highColor, .constant(constant)))
    }

    /// The color of the atmosphere region above the horizon, `high-color` extends further above the horizon than the `color` property and its spread can be controlled with `horizon-blend`. The opacity can be set to `0` to remove the high atmosphere color contribution.
    @_documentation(visibility: public)
    public func highColor(_ color: UIColor) -> Self {
        with(self, setter(\.highColor, .constant(StyleColor(color))))
    }

    /// Transition property for `highColor`
    @_documentation(visibility: public)
    public func highColorTransition(_ transition: StyleTransition) -> Self {
        with(self, setter(\.highColorTransition, transition))
    }

    /// The color of the atmosphere region above the horizon, `high-color` extends further above the horizon than the `color` property and its spread can be controlled with `horizon-blend`. The opacity can be set to `0` to remove the high atmosphere color contribution.
    @_documentation(visibility: public)
    public func highColor(_ expression: Expression) -> Self {
        with(self, setter(\.highColor, .expression(expression)))
    }


    /// Horizon blend applies a smooth fade from the color of the atmosphere to the color of space. A value of zero leaves a sharp transition from atmosphere to space. Increasing the value blends the color of atmosphere into increasingly high angles of the sky.
    @_documentation(visibility: public)
    public func horizonBlend(_ constant: Double) -> Self {
        with(self, setter(\.horizonBlend, .constant(constant)))
    }

    /// Transition property for `horizonBlend`
    @_documentation(visibility: public)
    public func horizonBlendTransition(_ transition: StyleTransition) -> Self {
        with(self, setter(\.horizonBlendTransition, transition))
    }

    /// Horizon blend applies a smooth fade from the color of the atmosphere to the color of space. A value of zero leaves a sharp transition from atmosphere to space. Increasing the value blends the color of atmosphere into increasingly high angles of the sky.
    @_documentation(visibility: public)
    public func horizonBlend(_ expression: Expression) -> Self {
        with(self, setter(\.horizonBlend, .expression(expression)))
    }


    /// The start and end distance range in which fog fades from fully transparent to fully opaque. The distance to the point at the center of the map is defined as zero, so that negative range values are closer to the camera, and positive values are farther away.
    @_documentation(visibility: public)
    public func range(start: Double, end: Double) -> Self {
        with(self, setter(\.range, .constant([start, end])))
    }

    /// Transition property for `range`
    @_documentation(visibility: public)
    public func rangeTransition(_ transition: StyleTransition) -> Self {
        with(self, setter(\.rangeTransition, transition))
    }

    /// The start and end distance range in which fog fades from fully transparent to fully opaque. The distance to the point at the center of the map is defined as zero, so that negative range values are closer to the camera, and positive values are farther away.
    @_documentation(visibility: public)
    public func range(_ expression: Expression) -> Self {
        with(self, setter(\.range, .expression(expression)))
    }


    /// The color of the region above the horizon and after the end of the `horizon-blend` contribution. The opacity can be set to `0` to have a transparent background.
    @_documentation(visibility: public)
    public func spaceColor(_ constant: StyleColor) -> Self {
        with(self, setter(\.spaceColor, .constant(constant)))
    }

    /// The color of the region above the horizon and after the end of the `horizon-blend` contribution. The opacity can be set to `0` to have a transparent background.
    @_documentation(visibility: public)
    public func spaceColor(_ color: UIColor) -> Self {
        with(self, setter(\.spaceColor, .constant(StyleColor(color))))
    }

    /// Transition property for `spaceColor`
    @_documentation(visibility: public)
    public func spaceColorTransition(_ transition: StyleTransition) -> Self {
        with(self, setter(\.spaceColorTransition, transition))
    }

    /// The color of the region above the horizon and after the end of the `horizon-blend` contribution. The opacity can be set to `0` to have a transparent background.
    @_documentation(visibility: public)
    public func spaceColor(_ expression: Expression) -> Self {
        with(self, setter(\.spaceColor, .expression(expression)))
    }


    /// A value controlling the star intensity where `0` will show no stars and `1` will show stars at their maximum intensity.
    @_documentation(visibility: public)
    public func starIntensity(_ constant: Double) -> Self {
        with(self, setter(\.starIntensity, .constant(constant)))
    }

    /// Transition property for `starIntensity`
    @_documentation(visibility: public)
    public func starIntensityTransition(_ transition: StyleTransition) -> Self {
        with(self, setter(\.starIntensityTransition, transition))
    }

    /// A value controlling the star intensity where `0` will show no stars and `1` will show stars at their maximum intensity.
    @_documentation(visibility: public)
    public func starIntensity(_ expression: Expression) -> Self {
        with(self, setter(\.starIntensity, .expression(expression)))
    }


    /// An array of two number values, specifying the vertical range, measured in meters, over which the fog should gradually fade out. When both parameters are set to zero, the fog will be rendered without any vertical constraints.
    @_documentation(visibility: public)
    public func verticalRange(start: Double, end: Double) -> Self {
        with(self, setter(\.verticalRange, .constant([start, end])))
    }

    /// Transition property for `verticalRange`
    @_documentation(visibility: public)
    public func verticalRangeTransition(_ transition: StyleTransition) -> Self {
        with(self, setter(\.verticalRangeTransition, transition))
    }

    /// An array of two number values, specifying the vertical range, measured in meters, over which the fog should gradually fade out. When both parameters are set to zero, the fog will be rendered without any vertical constraints.
    @_documentation(visibility: public)
    public func verticalRange(_ expression: Expression) -> Self {
        with(self, setter(\.verticalRange, .expression(expression)))
    }
}
// End of generated file.
