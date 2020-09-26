import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeightSlider extends StatefulWidget {
  @override
  _WeightSliderState createState() => _WeightSliderState();
}

class _WeightSliderState extends State<WeightSlider> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeightCubit, double>(
      builder: (BuildContext context, state) {
        return Slider(
          value: state,
          onChanged: (weight) =>
              BlocProvider.of<WeightCubit>(context).setWeight(weight),
          min: 0,
          max: 50,
          divisions: 49,
          label: state.round().toString() + " kg",
        );
      },
    );
  }
}

class WeightCubit extends Cubit<double> {
  WeightCubit() : super(1);
  void setWeight(double weight) => emit(weight);
}
