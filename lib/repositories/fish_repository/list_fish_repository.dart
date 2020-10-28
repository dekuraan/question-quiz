import 'dart:collection';
import 'dart:convert';

import 'package:fish_database/fish.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'fish_repository.dart';

class ListFishRepository extends FishRepository {
  List<Fish> _fish = [];
  final SharedPreferences prefs;

  ListFishRepository(this.prefs) {
    _fish = (prefs.getStringList("fish") ?? [])
        .map((e) => Fish.fromJson(jsonDecode(e)))
        .toList();
  }

  @override
  void addFish(Fish fish) {
    _fish.add(fish);
    prefs.setStringList(
        "fish", _fish.map((e) => jsonEncode(e.toJson())).toList());
  }

  @override
  void removeFish(Fish fish) {
    _fish.remove(fish);
    prefs.setStringList(
        "fish", _fish.map((e) => jsonEncode(e.toJson())).toList());
  }

  @override
  UnmodifiableListView<Fish> get fishList => UnmodifiableListView(_fish);
}
