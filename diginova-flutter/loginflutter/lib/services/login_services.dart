import 'dart:convert';

import 'package:loginflutter/model/login_model.dart';
import 'package:http/http.dart' as http;


class LoginServices {
  static Future<LoginModel> fetchLogin(var data) async{
    String url = "https://trisande.herokuapp.com/api/user/login";

    var response = await http.post(url, headers: {
      "Accept": "application/json"
    }, body: data);

      var _data = json.decode(response.body);
      return LoginModel.fromJson(_data);
  }
}