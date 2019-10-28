import 'package:flutter/material.dart';
import 'package:loginflutter/screen/home_page.dart';
import 'package:loginflutter/services/login_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  void saveSession(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("islogin", status);
  }

  void checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool("isLogin");
    if (status == true) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (Route<dynamic> routes) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    this.checkLogin();
  }

  void login() {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      var username = usernameController.text;
      var password = passwordController.text;

      // Map
      Map data = {"username": username, "password": password};

      LoginServices.fetchLogin(data).then((value) {
        if (value.status == 200) {
          saveSession(true);
        } else {
          saveSession(false);
          print("Login Gagal");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Text(
              "Sign in",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: TextField(
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    login();
                  },
                  color: Colors.blue,
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
