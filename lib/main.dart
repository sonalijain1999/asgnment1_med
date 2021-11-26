import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  static Duration duration = new Duration(milliseconds: 100);
  late Timer timer;
  double _value = 0.0;
  bool _active = false;

  @override
  void initState() {
    timer = new Timer.periodic(duration, _timeout);
  }

  void _timeout(Timer timer) {
    if(!_active) return;
    setState((){
      _value = _value + 0.01;
      if(_value == 1.0) _active = false;
    });
  }

  void _onPressed() {
    setState(() {
      _value = 0.0;
      _active = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Assignment1-Intermediate'),
      ),
      body:  Container(
        padding:  EdgeInsets.all(32.0),
        child:  Column(
          children:  <Widget>[
            LinearProgressIndicator(
              value: _value,
            ),
            ElevatedButton(
                onPressed: _onPressed,
                child: Text("start progress")),
          ],
        ),
      ),
    );
  }
}
