import 'dart:collection';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fish_database/fish.dart';
import 'package:fish_database/repositories/fish_repository/fish_repository.dart';
import 'package:fish_database/repositories/fish_repository/list_fish_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FishDatabaseCubit extends Cubit<UnmodifiableListView<Fish>> {
  final FishRepository fishRepo;
  final SharedPreferences prefs;
  FishDatabaseCubit(this.fishRepo, this.prefs)
      : super(UnmodifiableListView((prefs.getStringList("fish") ?? [])
            .map((e) => Fish.fromJson(jsonDecode(e)))
            .toList()));
  void addFish(Fish fish) {
    fishRepo.addFish(fish);
    prefs.setStringList(
        "fish", fishRepo.fishList.map((e) => jsonEncode(e.toJson())).toList());
    emit(fishRepo.fishList);
  }

  void removeFish(Fish fish) {
    fishRepo.removeFish(fish);
    prefs.setStringList(
        "fish", fishRepo.fishList.map((e) => jsonEncode(e.toJson())).toList());
    emit(fishRepo.fishList);
  }
}
