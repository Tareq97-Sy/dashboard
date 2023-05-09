import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_api_appllication/controllers/hotels_controller.dart';
import 'package:hotel_api_appllication/controllers/main_controller.dart';

class AddNewHotel extends StatelessWidget {
  AddNewHotel({super.key});
  final HotelController hc = Get.find<HotelController>();
  final MainController mc = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextFormField(
          decoration: InputDecoration(
            label: Text("name"),
          ),
          controller: hc.name,
        ),
        TextFormField(
          decoration: InputDecoration(
            label: Text("address"),
          ),
          controller: hc.address,
        ),
        TextFormField(
          decoration: InputDecoration(
            label: Text("phones"),
          ),
          controller: hc.phones,
        ),
        TextFormField(
          decoration: InputDecoration(
            label: Text("description"),
          ),
          controller: hc.description,
        ),
        TextButton(
            onPressed: () {
              hc.addHotel();
              mc.goToHotelsScreen();
            },
            child: Text("add hotel"))
      ]),
    );
  }
}
