import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_api_appllication/controllers/authentication_controller.dart';
import 'package:hotel_api_appllication/models/hotel.dart';

import '../models/user.dart';

class ProfileController extends GetxController {
  void onInit() {
    super.onInit();
    if (Get.arguments == User()) {
      currentUser = Get.arguments;
    } else if (Get.arguments == Hotel()) {
    
      getHotelProfile();
    } else {
      getUserProfile();
    }
  }

  final RxBool _isClicked = RxBool(false);
  final AuthenticationController _ac = Get.find();
  late final TextEditingController oldPassword;
  late final TextEditingController newPassword;
  Rx<User>? _currentUser;
  Rx<Hotel>? _currentHotel;
  String? uniqueId;
  bool get isClicked => _isClicked.value;
  User? get currentUser => _currentUser?.value;
  Hotel? get currentHotel => _currentHotel?.value;
  set currentUser(User? currentUser) => _currentUser = currentUser?.obs;

  ProfileController() {
    oldPassword = TextEditingController();
    newPassword = TextEditingController();
  }

  void _getUserProfile() async {
    try {
      dio.Response result = await dio.Dio().get(
          "https://hotels-api.ddns.net/api/profile",
          options: dio.Options(headers: {
            "Accept": 'Application/json',
            "Authorization": "Bearer ${_ac.token}"
          }));
      if (result.statusCode == 200 && result.data['error'] == 0) {
        // print(result.data);
        User temp = User()..fillData(result.data['user name ']);
        currentUser = temp;
      }
    } catch (e) {
      print('*********** exception in profile Controller *************');
    }
    _isClicked.value = false;
  }

  void getUserProfile() {
    _isClicked.value = true;
    _getUserProfile();
  }

  void _getHotelProfile() async {
    dio.Response result = await dio.Dio().get(
        "https://hotels-api.ddns.net/api/hotel/view/$uniqueId",
        options: dio.Options(headers: {
          "Accept": 'Application/json',
          "Authorization": "Bearer ${_ac.token}"
        }));
    if (result.statusCode == 200 && result.data['error'] == 0) {
      // print(result.data);
      Hotel temp = Hotel()..fillData(result.data['hotel']);
      _currentHotel = temp.obs;
    }
  }

  void getHotelProfile() {
    _isClicked.value = false;
    _getHotelProfile();
  }

  void changePassword() async {
    try {
      dio.Response result = await dio.Dio().post(
          "https://hotels-api.ddns.net/api/change-password",
          options: dio.Options(headers: {
            "Accept": 'Application/json',
            "Authorization": "Bearer ${_ac.token}"
          }),
          queryParameters: {
            "old password": oldPassword.text,
            "password": newPassword.text
          });
      if (result.statusCode == 200 && result.data['error'] == 0) {}
    } catch (e) {
      print(
          "******** there an error in change password in profile controller *******");
    }
  }
}
