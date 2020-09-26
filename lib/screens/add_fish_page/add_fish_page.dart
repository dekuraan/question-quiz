import 'package:fish_database/blocs/fish_database_cubit/fish_database_cubit.dart';
import 'package:fish_database/fish.dart';
import 'package:fish_database/screens/add_fish_page/widgets/water_type_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/weight_slider.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final speciesController = TextEditingController();
  WeightCubit weightCubit = WeightCubit();
  WaterTypeCubit waterTypeCubit = WaterTypeCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a Fish'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            width: 720.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: speciesController,
                    decoration: InputDecoration(
                      labelText: "Species",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocProvider(
                    create: (BuildContext context) => weightCubit,
                    child: WeightSlider(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocProvider(
                    create: (BuildContext context) => waterTypeCubit,
                    child: WaterTypePicker(),
                  ),
                ),
                RaisedButton(
                  child: Text("submit"),
                  onPressed: () {
                    BlocProvider.of<FishDatabaseCubit>(context).addFish(
                      Fish(
                        speciesController.text,
                        weightCubit.state.round(),
                        waterTypeCubit.state,
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
