import 'package:fish_database/blocs/fish_database_cubit/fish_database_cubit.dart';
import 'package:fish_database/fish.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final qController = TextEditingController();
  final aController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a Question'),
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
                    controller: qController,
                    decoration: InputDecoration(
                      labelText: "Question",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: aController,
                    decoration: InputDecoration(
                      labelText: "Answer",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                RaisedButton(
                  child: Text("submit"),
                  onPressed: () {
                    BlocProvider.of<FishDatabaseCubit>(context).addFish(
                      Fish(
                        qController.text,
                        aController.text,
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
