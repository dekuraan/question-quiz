import 'dart:collection';

import 'package:fish_database/fish.dart';
import 'fish_repository.dart';

class ListFishRepository extends FishRepository {
  List<Fish> _fish = [];

  @override
  void addFish(Fish fish) {
    _fish.add(fish);
  }

  @override
  void removeFish(Fish fish) {
    _fish.remove(fish);
  }

  @override
  UnmodifiableListView<Fish> get fishList => UnmodifiableListView(_fish);
}
