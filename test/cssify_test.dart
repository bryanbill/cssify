import 'package:test/test.dart';
import 'package:cssify/src/cssify.dart';
import 'package:cssify/src/generator.dart';

void main() {
  group('Cssify', () {
    test('creates base and breakpoint styles', () {
      final cssify = Cssify.create('button', {
        'base': {
          'style': {'color': 'red'},
          'state': {
            'hover': {'color': 'blue'},
          },
        },
        'md': {
          'style': {'color': 'green'},
          'state': {
            'hover': {'color': 'yellow'},
          },
        },
      });
      expect(cssify.selector, 'button');
      expect(cssify.breakpoints['base']!.style['color'], 'red');
      expect(cssify.breakpoints['md']!.style['color'], 'green');
    });
  });

  group('CssGenerator', () {
    test('generates grouped CSS for breakpoints', () {
      final styles = [
        Cssify.create('button', {
          'base': {
            'style': {'color': 'red'},
            'state': {
              'hover': {'color': 'blue'},
            },
          },
          'md': {
            'style': {'color': 'green'},
            'state': {
              'hover': {'color': 'yellow'},
            },
          },
        }),
        Cssify.create('input', {
          'base': {
            'style': {'border': '1px solid #ccc'},
            'state': {
              'focus': {'border-color': 'red'},
            },
          },
          'md': {
            'style': {'border': '1px solid #bbb'},
            'state': {
              'focus': {'border-color': 'green'},
            },
          },
        }),
      ];
      final generator = Generator(styles: styles);
      final css = generator.generate();
      expect(css, contains('button {'));
      expect(css, contains('input {'));
      expect(css, contains('@media'));
      expect(css, contains('button:hover'));
      expect(css, contains('input:focus'));
      expect(css, contains('color: green'));
      expect(css, contains('border: 1px solid #bbb'));
    });
  });
}
