import 'package:conectar_project/models/user_model.dart';

class LoginModel {
  final String accessToken;
  final UserModel user;

  LoginModel({required this.accessToken, required this.user});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      accessToken: json['access_token'] as String,
      user: UserModel.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'access_token': accessToken, 'user': user.toJson()};
  }
}
