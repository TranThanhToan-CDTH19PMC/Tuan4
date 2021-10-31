import 'package:flutter/material.dart';

void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Máy tính di động',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
            child: new Column(
          children: <Widget>[
            new Container(
                alignment: Alignment.centerRight,
                padding:
                    new EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child: new Text(output,
                    style: new TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ))),
            new Expanded(
              child: new Divider(),
            ),
      body: Center(
        child: Column(
 MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
