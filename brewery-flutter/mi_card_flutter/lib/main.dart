import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int nDonuts = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text("Demo"),
          backgroundColor: Colors.red,
        ),
        body: Container(
          child: Center(
            child: Text(
              "Number of dounts eaten: $nDonuts",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              nDonuts++;
            });
          },
        ),
      ),
    );
  }
}
