import 'package:fish_database/repositories/fish_repository/list_fish_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/fish_database_cubit/fish_database_cubit.dart';
import 'screens/home_page/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(FishDatabaseApp(prefs));
}

class FishDatabaseApp extends StatelessWidget {
  final SharedPreferences prefs;

  const FishDatabaseApp(this.prefs);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuestionBase 9000™',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) =>
            FishDatabaseCubit(ListFishRepository(), this.prefs),
        child: HomePage(),
      ),
    );
  }
}
