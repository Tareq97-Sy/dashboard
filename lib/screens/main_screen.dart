import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_api_appllication/controllers/authentication_controller.dart';
import 'package:hotel_api_appllication/controllers/main_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final MainController mc = Get.find();
  final AuthenticationController ac = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: UserAccountsDrawerHeader(
                  accountName: Text(""),
                  accountEmail: Text("accountemail"),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  currentAccountPictureSize: Size.square(50),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 165, 255, 137),
                    child: Text(
                      "",
                      style: TextStyle(fontSize: 30.0, color: Colors.blue),
                    ), //Text
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () {
                    mc.goToViewMyProfile();
                  },
                  icon: Icon(Icons.person_2_outlined)),
            ),
            Expanded(
              child: TextButton(
                  onPressed: () => mc.goToUsersScreen(),
                  child: Text('Go to Users Screen')),
            ),
            Expanded(
              child: TextButton(
                  onPressed: () => mc.goToHotelsScreen(),
                  child: Text("Go to Hotels Screen")),
            ),
            Expanded(
                child: TextButton(
                    onPressed: () {}, child: Text("Search for an hotel"))),
            Expanded(
              child: TextButton(
                  onPressed: () {
                    mc.goToAddHotelScreen();
                  },
                  child: Text("Add New Hotel")),
            )
          ]),
        ),
      ),
    );
  }
}
