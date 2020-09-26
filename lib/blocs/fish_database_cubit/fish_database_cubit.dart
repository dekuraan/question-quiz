import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:fish_database/fish.dart';
import 'package:fish_database/repositories/fish_repository/fish_repository.dart';
import 'package:fish_database/repositories/fish_repository/list_fish_repository.dart';

class FishDatabaseCubit extends Cubit<UnmodifiableListView<Fish>> {
  final FishRepository fishRepo = ListFishRepository();
  FishDatabaseCubit() : super(UnmodifiableListView([]));
  void addFish(Fish fish) {
    fishRepo.addFish(fish);
    emit(fishRepo.fishList);
  }

  void removeFish(Fish fish) {
    fishRepo.removeFish(fish);
    emit(fishRepo.fishList);
  }
}
