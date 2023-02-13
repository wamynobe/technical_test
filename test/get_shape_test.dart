import 'package:flutter_test/flutter_test.dart';
import 'package:technical_test/closest_node/get_shape.dart';
import 'package:technical_test/closest_node/shape.dart';

void main() {
  late final List<Shape> tc01;
  late final List<Shape> tc02;
  late final List<Shape> tc03;
  late final List<Shape> tc04;
  setUpAll(
    () {
      tc01 = [const Shape(10, 20)];
      tc02 = const [Shape(0, 50), Shape(50, 90), Shape(50, 20), Shape(0, 0)];
      tc03 = const [
        Shape(0, 50),
        Shape(50, 90),
        Shape(50, 20),
        Shape(0, 0),
        Shape(30, 20),
        Shape(10, 0),
        Shape(15, 25),
        Shape(60, 60)
      ];
      tc04 = const [Shape(0, 0), Shape(0, 0), Shape(0, 0), Shape(0, 0)];
    },
  );
  test(
    'get shape test',
    () {
      expect(get_shape([], 10, 10), null);
      expect(get_shape(tc01, 20, 10), tc01.first);
      expect(get_shape(tc02, 20, 40), tc02[0]);
      expect(get_shape(tc03, 20, 40), tc03[6]);
      expect(get_shape(tc04, 10, 10), tc04.first);
    },
  );
}
