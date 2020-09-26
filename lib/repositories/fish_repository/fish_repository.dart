import 'dart:collection';

import 'package:fish_database/fish.dart';

abstract class FishRepository {
  UnmodifiableListView<Fish> get fishList;
  void addFish(Fish fish);
  void removeFish(Fish fish);
}
