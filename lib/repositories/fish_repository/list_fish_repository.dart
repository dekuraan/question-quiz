import 'dart:collection';
import 'dart:convert';

import 'package:fish_database/fish.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'fish_repository.dart';

class ListFishRepository extends FishRepository {
  List<Fish> _fish = [];

  ListFishRepository();

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
