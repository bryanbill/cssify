/// # cssify
///
/// A Dart library for generating and managing CSS styles programmatically.
///
/// ## Features
/// - Define CSS rules using Dart classes and functions
/// - Generate CSS files or strings for use in web projects
/// - Support for media queries, style configuration, and property management
/// - Easily extendable for custom style logic
///
/// ## Usage
///
/// ```dart
/// import 'package:cssify/cssify.dart';
///
/// void main() {
///    var styles = [
///                 Cssify.create(':root', {
///                   'base': {
///                     'style': {'--primary-color': '#007BFF', '--secondary-color': '#6c757d'},
///                     },
///                   'md': {
///                     'style': {'--primary-color': '#0056b3', '--secondary-color': '#5a6268'},
///                   },
///                })
///             ];
///
///     String css = cssify(styles);
///     print(css);
/// }
/// ```
///
/// See the [README](https://pub.dev/packages/cssify) for more details and advanced usage.
///
/// ## Example
///
/// See the `example/` directory for a complete example.
///
/// ## License
///
/// MIT License. See [LICENSE](../LICENSE).
library;

export 'src/cssify.dart';
export 'src/generator.dart';
export 'src/style_config.dart';
export 'src/media_config.dart';

// Export any additional libraries intended for clients of this package below.
