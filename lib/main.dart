import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('카운터'),
        ),
        body: Counter(),
      ),
    );
  }
}

class Counter extends StatefulWidget {

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  // 최종값을 저장하는 것임.
  final counterSubject = BehaviorSubject<int>();

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('add'),
            onPressed: () {
              // 버튼누르면 1씩 올라감
              counterSubject.add(++counter);
            },
          ),
          StreamBuilder<int> (
            // 스트림 지원함. 흐름을 읽는 것임.
            stream: counterSubject.stream,
            // 초기값 지정
            initialData: 0,
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                return Text(
                  '${snapshot.data}',
                  style: TextStyle(fontSize: 30),
                );
              } else {
                return Text(
                  'dd'
                );
              }

            },
          )
        ],
      ),
    );
  }
}
