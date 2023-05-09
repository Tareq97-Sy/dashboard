import 'package:flutter/widgets.dart';

class User {
  int? id;
  String? uniqueId;
  String? name;
  String? email;
  String? phone;
  late final Image photo;
  //User({this.id, this.uniqueId, this.name, this.email, this.phone});
  void fillData(var data) {
    id = data['id'];
    uniqueId = data['uniqueId'];
    name = data['name'];
    email = data['email'];
    phone = data['phone'];
    photo = data['photo'] ??
        Image.asset(
          "resources/users_images/default_user_picture.jpeg",
          height: 100,
          width: 100,
        );
  }
}
