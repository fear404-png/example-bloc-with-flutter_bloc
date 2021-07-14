import 'package:blocexample/color_block.dart';
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
        create: (context) => ColorBloc(Colors.red),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("bloc with flutter_bloc"),
        centerTitle: true,
      ),
      body: Center(
          child: BlocBuilder<ColorBloc, Color>(
        builder: (context, currentColor) => AnimatedContainer(
          width: 100,
          height: 100,
          color: currentColor,
          duration: Duration(
            milliseconds: 500,
          ),
          curve: Curves.fastOutSlowIn,
        ),
      )),
      floatingActionButton: Row(
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
            backgroundColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
