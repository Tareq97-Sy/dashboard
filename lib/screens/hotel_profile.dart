import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_api_appllication/controllers/main_controller.dart';
import 'package:hotel_api_appllication/controllers/profile_controller.dart';

import '../models/user.dart';

class HotelProfile extends StatelessWidget {
  HotelProfile({super.key});
  final ProfileController pc = Get.find<ProfileController>();
  final MainController mc = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: Obx(() => pc.isClicked || pc.currentHotel == null
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: pc.currentUser!.photo,
                      ),
                      Expanded(child: Text("${pc.currentHotel!.id!}")),
                      Expanded(child: Text(pc.currentHotel!.name!)),
                      Expanded(child: Text(pc.currentHotel!.email!)),
                      //Expanded(child: Text(pc.currentHotel!.phone!)),
                     
                    ],
                  ),
                ))),
    );
  }
}
