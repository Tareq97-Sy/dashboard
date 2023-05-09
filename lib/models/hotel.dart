import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Hotel {
  int? id;
  String? uniqueId;
  String? name;
  String? address;
  String? email;
  String? description;
  late List<dynamic> photos;

  Hotel() {
    photos = [];
  }
  void fillData(var data) {
    id = data['id'];
    uniqueId = data['uniqueId'];
    name = data['name'];
    email = data['email'];
    address = data['address'];
    description = data['description'];
    Image img = Image.asset("resources/hotel_images/hotel_image.jpeg");
    photos.add(img);
    //data['photos'] != [] ? photos.addAll(data['photos']) : photos.add(img);
  }
}
