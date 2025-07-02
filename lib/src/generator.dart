import 'cssify.dart';
import 'media_config.dart';

/// Generates CSS code from a list of [Cssify] style definitions and media configurations.
///
/// The [Generator] class is responsible for converting Dart-based style definitions into valid CSS strings.
/// It supports responsive design by handling multiple breakpoints and media queries, and can be customized
/// with user-provided or default media configurations.
///
/// Example usage:
/// ```dart
/// final generator = Generator(styles: [/* Cssify objects */]);
/// final css = generator.generate();
/// print(css);
/// ```
class Generator {
  /// The list of [Cssify] style definitions to generate CSS from.
  final List<Cssify> styles;

  /// The map of breakpoint names to their corresponding [MediaConfig].
  /// Used to generate media queries for responsive styles.
  final Map<String, MediaConfig> mediaConfig;

  /// The default media configuration used if none is provided.
  static final Map<String, MediaConfig> _defaultMediaConfig = {
    'base': MediaConfig(screen: {'min-width': '0px', 'max-width': '767px'}),
    'md': MediaConfig(screen: {'min-width': '768px', 'max-width': '991px'}),
    'lg': MediaConfig(screen: {'min-width': '992px', 'max-width': '1199px'}),
    'xl': MediaConfig(screen: {'min-width': '1200px', 'max-width': '1599px'}),
    'xxl': MediaConfig(screen: {'min-width': '1600px', 'max-width': '9999px'}),
  };

  /// Creates a [Generator] instance.
  ///
  /// [styles]: The list of [Cssify] style definitions.
  /// [mediaConfig]: (Optional) Custom media configuration for breakpoints. If not provided, defaults are used.
  Generator({required this.styles, Map<String, MediaConfig>? mediaConfig})
    : mediaConfig = mediaConfig ?? _defaultMediaConfig;

  /// Formats a map of CSS properties into a CSS style string.
  String _formatStyle(Map<String, String> styles) {
    return styles.entries
        .map((entry) => '  	${entry.key}: ${entry.value};')
        .join('\n');
  }

  /// Generates the base (non-media query) CSS for a [Cssify] object.
  String _generateBaseStyles(Cssify cssify) {
    StringBuffer css = StringBuffer();
    if (cssify.breakpoints.containsKey('base')) {
      final base = cssify.breakpoints['base']!;
      css.write('${cssify.selector} {\n${_formatStyle(base.style)}\n}\n');
      base.state.forEach((state, properties) {
        css.write(
          '${cssify.selector}:$state {\n${_formatStyle(properties)}\n}\n',
        );
      });
      // Keyframes support
      base.keyframes.forEach((kfName, steps) {
        css.write('@keyframes $kfName {\n');
        steps.forEach((step, props) {
          css.write('  $step {\n${_formatStyle(props)}\n  }\n');
        });
        css.write('}\n');
      });
    }
    return css.toString();
  }

  /// Generates the complete CSS string for all styles and breakpoints.
  ///
  /// Returns the generated CSS as a [String].
  String generate() {
    StringBuffer output = StringBuffer();
    for (var cssify in styles) {
      output.write(_generateBaseStyles(cssify));
    }
    final Set<String> allBreakpoints = {
      for (var cssify in styles)
        ...cssify.breakpoints.keys.where((k) => k != 'base'),
    };
    for (var breakpoint in allBreakpoints) {
      if (!mediaConfig.containsKey(breakpoint)) continue;
      final media = mediaConfig[breakpoint]!;
      String mediaQuery = '@media ';
      List<String> conditions = [];
      if (media.screen.containsKey('min-width')) {
        conditions.add('(min-width: ${media.screen['min-width']})');
      }
      if (media.screen.containsKey('max-width')) {
        conditions.add('(max-width: ${media.screen['max-width']})');
      }
      mediaQuery += conditions.join(' and ');
      output.write('$mediaQuery {\n');
      for (var cssify in styles) {
        if (cssify.breakpoints.containsKey(breakpoint)) {
          final config = cssify.breakpoints[breakpoint]!;
          output.write(
            '  ${cssify.selector} {\n${_formatStyle(config.style)}\n  }\n',
          );
          config.state.forEach((state, properties) {
            output.write(
              '  ${cssify.selector}:$state {\n${_formatStyle(properties)}\n  }\n',
            );
          });
          // Keyframes support for breakpoints
          config.keyframes.forEach((kfName, steps) {
            output.write('  @keyframes $kfName {\n');
            steps.forEach((step, props) {
              output.write('    $step {\n${_formatStyle(props)}\n    }\n');
            });
            output.write('  }\n');
          });
        }
      }
      output.write('}\n');
    }
    return output.toString();
  }
}
