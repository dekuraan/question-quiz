import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/fish_database_cubit/fish_database_cubit.dart';
import 'screens/home_page/home_page.dart';

void main() {
  runApp(FishDatabaseApp());
}

class FishDatabaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FishBase 9000™',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => FishDatabaseCubit(),
        child: HomePage(),
      ),
    );
  }
}
