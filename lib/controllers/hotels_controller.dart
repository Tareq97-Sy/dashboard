import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:hotel_api_appllication/controllers/authentication_controller.dart';
import '../models/hotel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HotelController extends GetxController {
  List<Hotel>? get hotels => _hotels;
  bool get isClicked => _isClicked.value;
  RxList<Hotel>? _hotels = RxList();
  final RxBool _isClicked = RxBool(false);
  AuthenticationController _ac = Get.find<AuthenticationController>();
  Hotel? get searchHotel => _searchHotel?.value;

  HotelController() {
    name = TextEditingController();
    email = TextEditingController();
    address = TextEditingController();
    description = TextEditingController();
    phones = TextEditingController();
    hotelsc = TextEditingController();
  }

  Rx<Hotel>? _searchHotel;
  late final TextEditingController name;
  late final TextEditingController email;
  late final TextEditingController phones;
  late final TextEditingController address;
  late final TextEditingController description;
  late final TextEditingController hotelsc;

  @override
  void onInit() {
    getHotels();
    super.onInit();
  }

  void _getHotels() async {
    try {
      dio.Response result = await dio.Dio().get(
          "https://hotels-api.ddns.net/api/hotel/view",
          options: dio.Options(headers: {
            "Accept": "Application/json",
            "Authorization": "Bearer ${_ac.token}"
          }));
      if (result.statusCode == 200 && result.data['error'] == 0) {
        List<dynamic> allHotels = result.data['hotel'];
        List<Hotel> temp = [];
        for (var hotel in allHotels) {
          temp.add(Hotel()..fillData(hotel));
        }
        _hotels = temp.obs;
      }
    } catch (e) {
      print("there is exciption " + e.toString());
    }
    _isClicked.value = false;
  }

  void getHotels() {
    _isClicked.value = true;
    _getHotels();
  }

  void addHotel() async {
    dio.Response result = await dio.Dio().post(
        "https://hotels-api.ddns.net/api/hotel/add",
        options: dio.Options(headers: {
          "Accept": "Application/json",
          "Authorization": "Bearer ${_ac.token}"
        }),
        queryParameters: {
          "name": name.text,
          "email": email.text,
          "phones": phones.text,
          "address": address.text,
          "description": description.text,
        });
    if (result.statusCode == 200 && result.data['error'] == 0) {
      print(result.data['msg']);
    } else {
      print("something is wrong");
    }
  }

  void _viewHotel() async {
    //uniquId = _getUniqueId();

    if (hotelsc.text != '') {
      dio.Response result = await dio.Dio().get(
          "https://hotels-api.ddns.net/api/hotel/view/${hotelsc.text}",
          options: dio.Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${_ac.token}"
          }));
      if (result.statusCode == 200 && result.data['error'] == 0) {
        var data = result.data['hotel'];
        Hotel temp = Hotel()..fillData(data);
        _searchHotel = temp.obs;
        print(result.data);
      } else {
        Fluttertoast.showToast(
            msg: "the hotel has been deleted",
            backgroundColor: Colors.red,
            textColor: Colors.white,
            timeInSecForIosWeb: 3);
      }
    } else {
      _getHotels();
    }

    _isClicked.value = false;
  }

  void viewHotel() {
    _isClicked.value = true;
    _viewHotel();
  }

  void deleteHotel() async {
    dio.Response result = await dio.Dio().post(
        "https://hotels-api.ddns.net/api/hotel/delete",
        options: dio.Options(headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${_ac.token}"
        }),
        queryParameters: {"uniqueId": hotelsc.text});
    if (result.statusCode == 200 && result.data['error'] == 0) {
      Fluttertoast.showToast(
          msg: "The hotel has been deleted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Error happen when you try delete the hotel",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          timeInSecForIosWeb: 3);
    }
  }
}
