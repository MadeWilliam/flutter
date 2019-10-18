import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
        leading: Icon(Icons.ac_unit),
        actions: <Widget>[
          Icon(Icons.list),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.settings),
          )
        ],
        backgroundColor: Colors.green,
      ),
      body: ProfileBody(),
    );
  }
}

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Profile Screen"),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Back to Home"),
            color: Colors.pink,
          )
        ],
      ),
    );
  }
}