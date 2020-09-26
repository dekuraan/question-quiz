import 'water_type.dart';

class Fish {
  Fish(this.species, this.weight, this.waterType);
  final String species;
  final int weight;
  final WaterType waterType;
  int get children => factorial(weight);
}

int factorial(
  int x,
) {
  if (x <= 1) {
    return 1;
  }
  return x * factorial(x - 1);
}
