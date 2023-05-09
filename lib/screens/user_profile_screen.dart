import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_api_appllication/controllers/main_controller.dart';
import 'package:hotel_api_appllication/controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController pc = Get.find<ProfileController>();
  final MainController mc = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: Obx(() => pc.isClicked || pc.currentUser == null
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: pc.currentUser!.photo,
                      ),
                      Expanded(child: Text("${pc.currentUser!.id!}")),
                      Expanded(child: Text(pc.currentUser!.name!)),
                      Expanded(child: Text(pc.currentUser!.email!)),
                      Expanded(child: Text(pc.currentUser!.phone!)),
                      TextButton(
                          onPressed: () {
                            mc.goTOChangePasswordScreen();
                          },
                          child: Text('change-password'))
                    ],
                  ),
                ))),
    );
  }
}
