/// Represents the configuration for a CSS media query breakpoint.
///
/// The [MediaConfig] class defines the screen conditions (such as min-width and max-width)
/// for a specific media query breakpoint. It is used to generate responsive CSS rules.
///
/// Example:
/// ```dart
/// final config = MediaConfig(screen: {'min-width': '768px', 'max-width': '991px'});
/// ```
class MediaConfig {
  /// A map of screen conditions for the media query (e.g., min-width, max-width).
  final Map<String, String> screen;

  /// Creates a [MediaConfig] with the given [screen] conditions.
  MediaConfig({required this.screen});

  /// Creates a [MediaConfig] from a JSON map.
  ///
  /// The [json] parameter should contain a 'screen' key with a map of conditions.
  factory MediaConfig.fromJson(Map<String, dynamic> json) {
    return MediaConfig(screen: Map<String, String>.from(json['screen'] ?? {}));
  }
}
