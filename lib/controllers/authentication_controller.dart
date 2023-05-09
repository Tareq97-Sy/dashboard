import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_api_appllication/controllers/main_controller.dart';

import '../models/user.dart';

class AuthenticationController extends GetxService {


  AuthenticationController() {
    email = TextEditingController();
    password = TextEditingController();
    confirumed = TextEditingController();
    name = TextEditingController();
    phone = TextEditingController();
    
    }

@override
  void onInit() {
    
    super.onInit();
  }

  String? token;
  Rx<User>? _currentUser;
  final RxBool _isClicked = RxBool(false);
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirumed;
  late TextEditingController name;
  late TextEditingController phone;

  User? get currentUser => _currentUser?.value;
  bool get isClicked => _isClicked.value;
  
  void logIn() async {
    try {
      dio.Response r = await dio.Dio()
          .post("https://hotels-api.ddns.net/api/login", queryParameters: {
        "email": 'jd3an@gmail.com',
        "password": "123123123"
      });
      if (r.statusCode == 200 && r.data["error"] == 0) {
        print('all Correct in Login Main controller');
        token = "Bearer ${r.data['token']}";
      }
    } catch (e) {
      print("error has been happen in Login authentication");
    }
  }

  void logOut() async {
    try {
      dio.Response r = await dio.Dio().post(
          "https://hotels-api.ddns.net/api/logout",
          options: dio.Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${token}"
          }));
      if (r.statusCode == 200 && r.data['error'] == 0) {}
    } catch (e) {
      print('problem  in LogOut authentication');
    }
  }

  void signUp() async {
    try {
      dio.Response r = await dio.Dio()
          .post("https://hotels-api.ddns.net/api/sign-up", queryParameters: {
        "name": name.text,
        "email": email.text,
        "password": password.text,
        "confirmed": confirumed.text,
        "phone": phone.text,
      });
      if (r.statusCode == 200 &&
          r.data["error"] == 0 &&
          password.text == confirumed.text) {
        print('all Correct in signup');
        token = "Bearer ${r.data['token']}";
      }
    } catch (e) {
      print("error has been happen in signup authentication");
    }
  }

  void _getProfile() async {
    try {
      dio.Response result = await dio.Dio().get(
          "https://hotels-api.ddns.net/api/profile",
          options: dio.Options(headers: {
            "Accept": 'Application/json',
            "Authorization": "Bearer ${token}"
          }));
      if (result.statusCode == 200 && result.data['error'] == 0) {
        // print(result.data);
        User temp = User()..fillData(result.data['user name ']);
        _currentUser = temp.obs;
      }
    } catch (e) {
      print('*********** exception in profile Controller *************');
    }
    _isClicked.value = false;
  }

  void getProfile() {
    _isClicked.value = true;
    _getProfile();
  }


}
