/// Represents the style configuration for a CSS selector, including base styles and state-specific styles.
///
/// The [StyleConfig] class holds the CSS properties for a selector, as well as additional styles for pseudo-classes or states (e.g., :hover, :active).
///
/// Example:
/// ```dart
/// final config = StyleConfig(
///   style: {'color': 'red', 'font-size': '16px'},
///   state: {
///     'hover': {'color': 'blue'},
///     'active': {'color': 'green'},
///   },
/// );
/// ```
class StyleConfig {
  /// The base CSS properties for the selector.
  final Map<String, String> style;

  /// A map of state names (e.g., 'hover', 'active') to their corresponding CSS properties.
  final Map<String, Map<String, String>> state;

  /// Creates a [StyleConfig] with the given [style] and [state] maps.
  StyleConfig({required this.style, required this.state});

  /// Creates a [StyleConfig] from a JSON map.
  ///
  /// The [json] parameter should contain 'style' and optionally 'state' keys.
  factory StyleConfig.fromJson(Map<String, dynamic> json) {
    return StyleConfig(
      style: Map<String, String>.from(json['style'] ?? {}),
      state:
          (json['state'] as Map<String, dynamic>?)?.map(
            (key, value) => MapEntry(key, Map<String, String>.from(value)),
          ) ??
          {},
    );
  }
}
