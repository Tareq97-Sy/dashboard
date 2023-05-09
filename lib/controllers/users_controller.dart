import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_api_appllication/controllers/authentication_controller.dart';

import '../models/user.dart';

class UserController extends GetxController {
  UserController() {
    userNameSearch = TextEditingController();
    allUsers = [];
  }
  @override
  void dispose() {
    userNameSearch.dispose();
    super.dispose();
  }

  bool get isClicked => _isClicked.value;
  List<User>? get users => _users;

  late List<dynamic> allUsers;
  final RxBool _isClicked = RxBool(false);
  RxList<User>? _users = RxList();
  AuthenticationController _ac = Get.find<AuthenticationController>();
  late TextEditingController userNameSearch;
  String? uniquId;
  Rx<User>? _specificUser;
  User? get specificUser => _specificUser?.value;
  //set specificUser(User? specificUser) => _specificUser = specificUser?.obs;
  @override
  void onInit() {
    getUsers();
    super.onInit();
  }

  void _getUsers() async {
    try {
      dio.Response result = await dio.Dio().get(
          "https://hotels-api.ddns.net/api/view",
          options: dio.Options(headers: {
            "Accept": "Application/json",
            "Authorization": "Bearer ${_ac.token}"
          }));
      if (result.statusCode == 200 && result.data['error'] == 0) {
        //convert jsonMap to Object by factory
        /*List<User> allUsers = (result.data['user '] as List)
            .map((e) => User.fromJson(e))
            .toList();*/
        List<User> temp = [];
        allUsers = result.data['user '];
        for (var u in allUsers) {
          temp.add(User()..fillData(u));
        }
        _users = temp.obs;
        print(
            "***** you are in get Users function in list of users Controller ******");
        //print(allUsers);
      }
    } catch (e) {
      print("error in dio" + e.toString());
    }
    _isClicked.value = false;
  }

  void getUsers() {
    _isClicked.value = true;
    _getUsers();
  }

  void _viewUser() async {
    if (userNameSearch.text != '') {
      dio.Response result = await dio.Dio().get(
          "https://hotels-api.ddns.net/api/view/${userNameSearch.text}",
          options: dio.Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${_ac.token}"
          }));
      if (result.statusCode == 200 && result.data['error'] == 0) {
        var data = result.data['user '];
        User temp = User()..fillData(data);
        _specificUser = temp.obs;
        print(result.data);
      }
    } else {
      _getUsers();
    }

    _isClicked.value = false;
  }

  void viewUser() {
    _isClicked.value = true;
    _viewUser();
  }

  String? _getUniqueId() {
    if (userNameSearch.text != '') {
      for (User u in users!) {
        if (userNameSearch.text == u.name) {
          uniquId = u.uniqueId!;
          return uniquId;
        }
      }
    }
  }
}
