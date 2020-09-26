import 'package:fish_database/fish.dart';
import 'package:fish_database/water_type.dart';
import 'package:flutter/material.dart';

class FishView extends StatelessWidget {
  FishView(this.fish);
  final Fish fish;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(fish.species),
      leading: Text(waterTypeToEmoji(fish.waterType)),
      subtitle: Text("${fish.weight} kg"),
      trailing: Text("${fish.children} children"),
    );
  }

  String waterTypeToEmoji(WaterType waterType) {
    if (waterType == WaterType.Salt) {
      return '🧂';
    }
    if (waterType == WaterType.Fresh) {
      return '💧';
    }
    if (waterType == WaterType.Brackish) {
      return '🏞️';
    }
    return "❗";
  }
}
