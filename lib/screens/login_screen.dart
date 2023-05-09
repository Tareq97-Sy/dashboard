import 'package:flutter/material.dart';
import 'package:hotel_api_appllication/controllers/authentication_controller.dart';
import 'package:get/get.dart';
import 'package:hotel_api_appllication/controllers/main_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final AuthenticationController ac = Get.find<AuthenticationController>();
  final MainController mc = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: ac.email,
            ),
            TextField(
              controller: ac.password,
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      ac.logIn();

                      mc.goToMainScreen();
                    },
                    child: Text('Login')),
                // TextButton(
                //     onPressed: () => Get.toNamed("/signup"),
                //     child: Text("you don't have an account , Sign up")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
