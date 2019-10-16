import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: RegisterBody(),
        ),
      ),
    );
  }
}

class RegisterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 100, left: 30, right: 30),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: <Widget>[
          Text(
            "Register Latihan 2",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(hintText: "Username"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(hintText: "Email"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(hintText: "Password"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
              decoration: InputDecoration(hintText: "Confirm Password"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.pink,
                child: Text(
                  "REGISTER",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
              ),
            ),
          )
        ]));
  }
}
