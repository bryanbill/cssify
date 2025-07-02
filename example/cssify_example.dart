import 'package:cssify/cssify.dart';

void main() {
  List<Cssify> styles = [
    // root variable styles
    Cssify.create(':root', {
      'base': {
        'style': {'--primary-color': '#007BFF', '--secondary-color': '#6c757d'},
      },
      'md': {
        'style': {'--primary-color': '#0056b3', '--secondary-color': '#5a6268'},
      },
    }),
    Cssify.create('button', {
      'base': {
        'style': {'background-color': '#f0f0f0', 'font-size': '16px'},
        'state': {
          'hover': {'color': '#007BFF'},
          'active': {'color': '#0056b3'},
        },
      },
      'md': {
        'style': {'background-color': '#e0e0e0', 'font-size': '18px'},
        'state': {
          'hover': {'color': '#0056b3'},
          'active': {'color': '#003f7f'},
        },
      },
    }),
    Cssify.create('input', {
      'base': {
        'style': {'border': '1px solid #ccc', 'padding': '10px'},
        'state': {
          'focus': {'border-color': '#007BFF'},
        },
      },
      'md': {
        'style': {'border': '1px solid #bbb', 'padding': '12px'},
        'state': {
          'focus': {'border-color': '#0056b3'},
        },
      },
    }),
  ];

  String css = cssify(styles);
  print(css);
}
