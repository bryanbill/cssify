# cssify

Generate and manage CSS styles programmatically in Dart. Effortlessly create responsive, maintainable, and dynamic CSS for your web projects—all from the comfort of your Dart codebase.

---

## ✨ Features

- **Define CSS in Dart:** Use Dart classes and functions to build CSS rules.
- **Responsive by Design:** Built-in support for breakpoints and media queries.
- **Stateful Styling:** Easily add styles for pseudo-classes like `:hover`, `:active`, and more.
- **Keyframes and Animations:** Define complex animations and transitions.
- **Extensible:** Compose, extend, and customize your style logic.
- **Type-Safe:** Enjoy compile-time safety and autocompletion in your editor.

---

## 🚀 Getting Started

Add cssify to your `pubspec.yaml`:

```yaml
dependencies:
  cssify: ^1.0.0
```

Import it in your Dart code:

```dart
import 'package:cssify/cssify.dart';
```

---

## 🛠️ Usage

Define your styles using Dart:

```dart
final containerStyle = Cssify(
  '.container',
  breakpoints: {
    'base': StyleConfig(
      style: {'display': 'flex', 'gap': '16px'},
      state: {
        'hover': {'background': 'lightgray'},
      },
    ),
    'md': StyleConfig(
      style: {'gap': '32px'},
      state: {},
    ),
  },
);

final css = cssify([containerStyle]);
print(css);
```

---

## 📦 API Overview

### Cssify

Represents a CSS style definition for a selector, supporting responsive breakpoints.

```dart
class Cssify {
  final String selector;
  final Map<String, StyleConfig> breakpoints;

  Cssify(this.selector, {required this.breakpoints});
  factory Cssify.create(String selector, Map<String, dynamic> json);
}
```

### StyleConfig

Holds base and state-specific CSS properties for a selector.

```dart
class StyleConfig {
  final Map<String, String> style;
  final Map<String, Map<String, String>> state;

  StyleConfig({required this.style, required this.state});
  factory StyleConfig.fromJson(Map<String, dynamic> json);
}
```

### MediaConfig

Defines screen conditions for media query breakpoints.

```dart
class MediaConfig {
  final Map<String, String> screen;

  MediaConfig({required this.screen});
  factory MediaConfig.fromJson(Map<String, dynamic> json);
}
```

---

## 📖 Example

See the [`example/`](example/) directory for a complete working example.

---

## 📚 Documentation

Full API docs are available in the source code. Each class and function is documented for easy reference.

---

## 📝 License

MIT License. See [LICENSE](LICENSE).

---

## 💡 Contributing

Contributions, issues, and feature requests are welcome! Feel free to open an issue or submit a pull request.

---

Made with ❤️ in Dart.
