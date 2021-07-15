import 'package:blocexample/color_bloc.dart';
import 'package:blocexample/screen_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => ColorBloc(ScreenData()),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bloc with flutter_bloc"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          BlocBuilder<ColorBloc, ScreenData>(
              builder: (context, text) => Text(ScreenData.text)),
          Center(
              child: BlocBuilder<ColorBloc, ScreenData>(
            builder: (context, currentColor) => AnimatedContainer(
              width: 100,
              height: 100,
              color: ScreenData.color,
              duration: Duration(
                milliseconds: 500,
              ),
              curve: Curves.fastOutSlowIn,
            ),
          )),
        ],
      ),
      floatingActionButton: Buttons(),
    );
  }
}

class Buttons extends StatelessWidget {
  Buttons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(context.toString());
    ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            _bloc.add(ColorEvent.event_red);
          },
          backgroundColor: Colors.red,
        ),
        SizedBox(
          width: 10,
        ),
        FloatingActionButton(
          onPressed: () {
            _bloc.add(ColorEvent.event_green);
          },
          backgroundColor: Colors.green,
        )
      ],
    );
  }
}
