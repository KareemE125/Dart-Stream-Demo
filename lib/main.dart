import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget
{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
        title: 'Stream Demo',
        home: MyHomePage()
    );
  }
}


class MyHomePage extends StatelessWidget
{
  int count = 1;

  StreamController streamController = StreamController.broadcast();
  Stream get sout => streamController.stream;
  Sink get sin => streamController.sink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder(
              stream: sout,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return Center(
                  child: Text(
                    snapshot.hasData ? snapshot.data.toString() : "NO DATA FOUND",
                    style: const TextStyle(fontSize: 40),
                  ),
                );
              },
            ),
            OutlinedButton(
                onPressed: (){
                  count = count + 12;
                  sin.add(count);
                },
                child: Text("Add To Stream")
            )
          ],
        ),
      ),
    );
  }

}
