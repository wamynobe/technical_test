import 'dart:math';

import 'shape.dart';

// this method nullable because maybe no shape in list of shapes input
Shape? get_shape(List<Shape> shapes, int mouseX, mouseY) {
  if (shapes.isEmpty) {
    return null;
  }
  if (shapes.length == 1) {
    return shapes.first;
  }
  Map<double, Shape> distanceMapToShape = {};
  //map all shape with its distance
  for (var shape in shapes) {
    distanceMapToShape.addAll(
      {
        // with 2 points A(x,y) B(x,y) => distance = sqrt(pow(Ax - Bx) + pow(Ay - By))
        sqrt(pow((mouseX - shape.x), 2) + pow((mouseY - shape.y), 2)): shape,
      },
    );
  }
  final sortedDistance = distanceMapToShape.entries.toList()
    ..sort((a, b) => b.key.compareTo(a.key));
  return sortedDistance.reversed.first.value;
}
