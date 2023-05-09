import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_api_appllication/controllers/authentication_controller.dart';
import 'package:hotel_api_appllication/controllers/main_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final AuthenticationController ac = Get.find<AuthenticationController>();
  final MainController mc = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: ac.name,
            ),
            TextField(
              controller: ac.phone,
            ),
            TextField(
              controller: ac.email,
            ),
            TextField(
              controller: ac.password,
            ),
            TextField(
              controller: ac.confirumed,
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      ac.signUp();
                      mc.goToMainScreen();
                    },
                    child: Text('Sign Up')),
                TextButton(
                    onPressed: () => Get.toNamed("/login"),
                    child: Text('you have an account?')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
