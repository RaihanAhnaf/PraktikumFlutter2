import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Praktikum 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var i,j,prima;
  int _counter = 1;
  String _text = "Ganjil";
  String _prima = "Prima";

  void _incrementCounter() {
    setState(() {
      _counter++;
      if(_counter>20){
        _counter = 0;
      }

      // percobaan 3
      // _text = "Ganjil: ";
      // for(int i=0;i<=_counter;i++){
      //   if(i%2 != 0){
      //     _text += '${i}, ';
      //   }
      // }

      // percobaan 2
      // if(_counter%2 == 0){
      //   _text = "Genap";
      // }else{
      //   _text = "Ganjil";
      // }

      _text = "Genap: ";
      for(i=0;i<=_counter-1;i++){
        if(i%2 == 0){
          if(i%3 == 0){
            _text += '${i}, ';
          }
        }
      }

      _prima = "Prima: ";
      for(i=1;i<=_counter;i++){
        prima=0;
        for(j=2;j<=i/2;j++){
          if(i%j==0){
            prima++;
            break;
          }
        }
        if(prima==0 && i!=1)
          _prima += '${i}, ';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              _text,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              _prima,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
