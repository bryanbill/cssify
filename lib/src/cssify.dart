import 'package:cssify/src/generator.dart';
import 'package:cssify/src/style_config.dart';
import 'package:cssify/src/media_config.dart';

/// Represents a CSS style definition for a given selector, supporting responsive breakpoints.
///
/// The [Cssify] class allows you to define CSS rules for a selector, with support for multiple breakpoints.
/// Each breakpoint is mapped to a [StyleConfig] object, enabling responsive and dynamic style generation.
///
/// Example:
/// ```dart
/// final style = Cssify(
///   '.container',
///   breakpoints: {
///     'base': StyleConfig(...),
///     'md': StyleConfig(...),
///   },
/// );
/// ```
class Cssify {
  /// The CSS selector this style applies to (e.g., '.container', '#header').
  final String selector;

  /// A map of breakpoint names to their corresponding [StyleConfig].
  /// For example: { 'base': StyleConfig, 'md': StyleConfig }
  final Map<String, StyleConfig> breakpoints;

  /// Creates a [Cssify] instance for a selector and its breakpoints.
  Cssify(this.selector, {required this.breakpoints});

  /// Creates a [Cssify] instance from a JSON-like map.
  ///
  /// [selector] is the CSS selector.
  /// [json] is a map where each key is a breakpoint and each value is a JSON map for [StyleConfig].
  factory Cssify.create(String selector, Map<String, dynamic> json) {
    return Cssify(
      selector,
      breakpoints: json.map(
        (key, value) => MapEntry(key, StyleConfig.fromJson(value)),
      ),
    );
  }
}

/// Generates a CSS string from a list of [Cssify] style definitions.
///
/// [styles]: A list of [Cssify] objects representing CSS rules.
/// [mediaConfig]: (Optional) A map of media query names to [MediaConfig] for responsive design.
///
/// Returns the generated CSS as a [String].
String cssify(List<Cssify> styles, {Map<String, MediaConfig>? mediaConfig}) =>
    Generator(styles: styles, mediaConfig: mediaConfig).generate();
