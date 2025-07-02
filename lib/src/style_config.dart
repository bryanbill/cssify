/// Represents the style configuration for a CSS selector, including base styles, state-specific styles, and keyframes.
///
/// The [StyleConfig] class holds the CSS properties for a selector, as well as additional styles for pseudo-classes or states (e.g., :hover, :active),
/// and keyframes for animations.
///
/// Example:
/// ```dart
/// final config = StyleConfig(
///   style: {'color': 'red', 'font-size': '16px'},
///   state: {
///     'hover': {'color': 'blue'},
///     'active': {'color': 'green'},
///   },
///   keyframes: {
///     'fadeIn': {
///       '0%': {'opacity': '0'},
///       '100%': {'opacity': '1'},
///     },
///   },
/// );
/// ```
class StyleConfig {
  /// The base CSS properties for the selector.
  final Map<String, String> style;

  /// A map of state names (e.g., 'hover', 'active') to their corresponding CSS properties.
  final Map<String, Map<String, String>> state;

  /// A map of keyframe names to their keyframe steps and properties.
  /// For example: { 'fadeIn': { '0%': {...}, '100%': {...} } }
  final Map<String, Map<String, Map<String, String>>> keyframes;

  /// Creates a [StyleConfig] with the given [style], [state], and [keyframes] maps.
  StyleConfig({
    required this.style,
    required this.state,
    Map<String, Map<String, Map<String, String>>>? keyframes,
  }) : keyframes = keyframes ?? const {};

  /// Creates a [StyleConfig] from a JSON map.
  ///
  /// The [json] parameter should contain 'style', optionally 'state', and optionally 'keyframes' keys.
  factory StyleConfig.fromJson(Map<String, dynamic> json) {
    return StyleConfig(
      style: Map<String, String>.from(json['style'] ?? {}),
      state:
          (json['state'] as Map<String, dynamic>?)?.map(
            (key, value) => MapEntry(key, Map<String, String>.from(value)),
          ) ??
          {},
      keyframes:
          (json['keyframes'] as Map<String, dynamic>?)?.map(
            (kfName, steps) => MapEntry(
              kfName,
              (steps as Map<String, dynamic>).map(
                (step, props) =>
                    MapEntry(step, Map<String, String>.from(props)),
              ),
            ),
          ) ??
          {},
    );
  }
}
