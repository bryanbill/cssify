import 'package:cssify/cssify.dart';
import 'package:web/web.dart' as web;

void main() {
  final now = DateTime.now();
  final element = web.document.querySelector('#output') as web.HTMLDivElement;
  final css = cssify(styles, {
    'sm': 
  });

  // add to the header
  final styleElement = web.HTMLStyleElement();
  styleElement.text = css;
  web.document.head!.append(styleElement);

  // add to the body
  final div = web.HTMLDivElement()
    ..className = 'jumbotron'
    ..text = 'Generated CSS at ${now.toIso8601String()}'
    ..style.cssText = 'font-family: Arial, sans-serif; padding: 20px;';
  element.append(div);
}

List<Cssify> styles = [
  Cssify.create(':root', {
    'base': {
      'style': {'--primary-color': 'red', '--secondary-color': '#6c757d'},
    },
    'md': {
      'style': {'--primary-color': 'blue', '--secondary-color': '#5a6268'},
    },
    'lg': {
      'style': {'--primary-color': 'green', '--secondary-color': '#343a40'},
    },
  }),

  Cssify.create(".jumbotron", {
    'base': {
      'style': {
        'background-color': 'var(--primary-color)',
        'color': 'white',
        'padding': '20px',
        'border-radius': '5px',
      },
      'state': {
        'hover': {'background-color': 'var(--secondary-color)'},
      },
    },
    'md': {
      'style': {
        'padding': '30px',
        'font-size': '1.2em',
        'background-color': 'var(--primary-color)',
      },
    },
  }),
];
