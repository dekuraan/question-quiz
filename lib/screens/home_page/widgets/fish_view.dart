import 'package:fish_database/fish.dart';
import 'package:flutter/material.dart';

class FishView extends StatelessWidget {
  FishView(this.fish);
  final Fish fish;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(fish.question),
      subtitle: Text(fish.answer),
      trailing: RaisedButton(
        child: Text("Ask Question"),
        onPressed: () {
          showDialog(
            context: context,
            builder: (builderContext) {
              final aController = TextEditingController();
              return AlertDialog(
                title: Text(fish.question),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                        Navigator.of(context).pop();
                        if (fish.answer == aController.text) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text("Correct!")));
                        } else {
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "The correct answer was ${fish.answer}")));
                        }
                      },
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
