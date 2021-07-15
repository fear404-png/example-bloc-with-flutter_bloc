import 'package:blocexample/screen_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ColorEvent { event_red, event_green }

class ColorBloc extends Bloc<ColorEvent, ScreenData> {
  Color _color = Colors.red;

  ColorBloc(ScreenData initialState) : super(initialState);

  @override
  Stream<ScreenData> mapEventToState(ColorEvent event) async* {
    _color = (event == ColorEvent.event_red) ? Colors.red : Colors.green;
    ScreenData.color = _color;
    if (ScreenData.color == Colors.green)
      ScreenData.text = "no u =)";
    else
      ScreenData.text = "ur mom gay =(";
    yield ScreenData();
  }
}
