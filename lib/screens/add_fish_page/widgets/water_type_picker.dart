import 'package:bloc/bloc.dart';
import 'package:fish_database/water_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WaterTypePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          WaterTypeRadioListTile(WaterType.Fresh),
          WaterTypeRadioListTile(WaterType.Brackish),
          WaterTypeRadioListTile(WaterType.Salt),
        ],
      ),
    );
  }
}

class WaterTypeRadioListTile extends StatelessWidget {
  final WaterType waterType;
  const WaterTypeRadioListTile(this.waterType);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterTypeCubit, WaterType>(
        builder: (BuildContext context, state) {
      return RadioListTile<WaterType>(
        title: Text(waterTypeToString(waterType)),
        value: waterType,
        groupValue: state,
        onChanged: (newWaterType) =>
            BlocProvider.of<WaterTypeCubit>(context).setWaterType(newWaterType),
      );
    });
  }
}

class WaterTypeCubit extends Cubit<WaterType> {
  WaterTypeCubit() : super(WaterType.Fresh);
  void setWaterType(WaterType waterType) => emit(waterType);
}
