
import 'package:loginflutter/model/profile_model.dart';

class LoginModel{
  int status;
  String message;

  LoginModel({
    this.status, this.message
  });

  factory LoginModel.fromJson(var json) {
    return LoginModel(
      status: int.parse(json["status"].toString()),
      message: json["message"],
    );
  }

}