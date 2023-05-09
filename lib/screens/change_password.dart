import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_api_appllication/controllers/profile_controller.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  final ProfileController pc = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: pc.oldPassword,
            decoration: InputDecoration(label: Text("Old-password")),
          ),
          TextField(
            controller: pc.newPassword,
            decoration: InputDecoration(label: Text("New-password")),
          ),
          TextButton(
              onPressed: () => pc.changePassword(),
              child: Text("Save Password"))
        ],
      ),
    );
  }
}
