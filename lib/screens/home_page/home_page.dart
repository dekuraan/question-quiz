import 'dart:collection';

import 'package:fish_database/blocs/fish_database_cubit/fish_database_cubit.dart';
import 'package:fish_database/fish.dart';
import 'package:fish_database/screens/add_fish_page/add_fish_page.dart';
import 'package:fish_database/screens/home_page/widgets/fish_view.dart';
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
          title: Text('Questionbase 9000 (TM)'),
        ),
        body: BlocBuilder<FishDatabaseCubit, UnmodifiableListView<Fish>>(
          builder: (context, state) {
            return state.isEmpty
                ? Center(
                    child: Text(
                        "Add some questions by pressing the '+' button!\nSwipe any questions to remove them.\nQuestions are saved to your cookies!"),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: RaisedButton(
                          child: Text("Ask all questions"),
                          onPressed: () {
                            void recursiveShowAllQuestions(int i) {
                              if (i == state.length) {
                                return;
                              }
                              showDialog(
                                context: context,
                                builder: (builderContext) {
                                  final aController = TextEditingController();
                                  final fish = state[i];
                                  return AlertDialog(
                                    title: Text(fish.question),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                            if (fish.answer ==
                                                aController.text) {
                                              Scaffold.of(context).showSnackBar(
                                                  SnackBar(
                                                      content:
                                                          Text("Correct!")));
                                            } else {
                                              Scaffold.of(context).showSnackBar(
                                                  SnackBar(
                                                      content: Text(
                                                          "The correct answer was ${fish.answer}")));
                                            }
                                            recursiveShowAllQuestions(i + 1);
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            }

                            recursiveShowAllQuestions(0);
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            final fish = state[index];
                            return Dismissible(
                              child: FishView(fish),
                              key: Key(fish.toString()),
                              background: Container(color: Colors.red),
                              onDismissed: (_) {
                                BlocProvider.of<FishDatabaseCubit>(context)
                                    .removeFish(fish);
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "Removed ${fish.question} ${fish.answer}"),
                                ));
                              },
                            );
                          },
                          itemCount: state.length,
                        ),
                      ),
                    ],
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
