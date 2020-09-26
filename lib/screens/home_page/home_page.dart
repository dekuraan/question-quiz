import 'dart:collection';

import 'package:fish_database/blocs/fish_database_cubit/fish_database_cubit.dart';
import 'package:fish_database/fish.dart';
import 'package:fish_database/screens/add_fish_page/add_fish_page.dart';
import 'package:fish_database/screens/home_page/widgets/fish_view.dart';
import 'package:fish_database/water_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

enum FishComponent {
  Species,
  Weight,
  WaterType,
  Children,
}

class _HomePageState extends State<HomePage> {
  bool ascending = true;
  FishComponent sortBy = FishComponent.Species;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Fishbase 9000 (TM)'),
          actions: [
            DropdownButton<FishComponent>(
              value: sortBy,
              icon: IconButton(
                icon:
                    Icon(ascending ? Icons.arrow_downward : Icons.arrow_upward),
                onPressed: () => setState(() => ascending = !ascending),
              ),
              onChanged: (FishComponent newValue) {
                setState(() {
                  sortBy = newValue;
                });
              },
              items: [
                DropdownMenuItem(
                  child: Text("Species"),
                  value: FishComponent.Species,
                ),
                DropdownMenuItem(
                  child: Text("Weight"),
                  value: FishComponent.Weight,
                ),
                DropdownMenuItem(
                  child: Text("Water Type"),
                  value: FishComponent.WaterType,
                ),
                DropdownMenuItem(
                  child: Text("Children"),
                  value: FishComponent.Children,
                ),
              ],
            )
          ],
        ),
        body: BlocBuilder<FishDatabaseCubit, UnmodifiableListView<Fish>>(
          builder: (context, state) {
            final fishies = state.toList();
            fishies.sort((current, next) {
              if (sortBy == FishComponent.Species) {
                return (ascending ? 1 : -1) *
                    current.species.compareTo(next.species);
              }
              if (sortBy == FishComponent.Weight) {
                return (ascending ? 1 : -1) *
                    current.weight.compareTo(next.weight);
              }
              if (sortBy == FishComponent.WaterType) {
                return (ascending ? 1 : -1) *
                    WaterType.values
                        .indexOf(current.waterType)
                        .compareTo(WaterType.values.indexOf(next.waterType));
              }
              if (sortBy == FishComponent.Children) {
                return (ascending ? 1 : -1) *
                    current.children.compareTo(next.children);
              }
              return null;
            });
            return fishies.isEmpty
                ? Center(
                    child: Text(
                        "Add some fishies by pressing the '+' button!\nSort with the dropdown in the top left.\nSwipe any fish to remove them."),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      final fish = fishies[index];
                      return Dismissible(
                        child: FishView(fish),
                        key: Key(fish.toString()),
                        background: Container(color: Colors.red),
                        onDismissed: (_) {
                          BlocProvider.of<FishDatabaseCubit>(context)
                              .removeFish(fish);
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "Removed ${fish.weight} kg ${fish.species}"),
                          ));
                        },
                      );
                    },
                    itemCount: state.length,
                  );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return BlocProvider.value(
                    value: BlocProvider.of<FishDatabaseCubit>(context),
                    child: AddPage());
              },
            ),
          ),
        ),
      );
}
