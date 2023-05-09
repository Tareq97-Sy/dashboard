import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_api_appllication/controllers/main_controller.dart';
import 'package:hotel_api_appllication/controllers/users_controller.dart';

class ListUsersScreen extends StatelessWidget {
  ListUsersScreen({Key? key}) : super(key: key);
  final UserController uc = Get.find<UserController>();
  final MainController mc = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Obx(() => uc.isClicked == true
                ? Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              uc.getUsers();
                            },
                            child: Text("Get Users")),
                      ),
                      Expanded(
                          flex: 3,
                          child: ListView(
                            children: [
                              ...uc.users!.map((e) => ListTile(
                                    leading: CircleAvatar(
                                        backgroundImage: e.photo.image),
                                    title: Text(e.name!),
                                    subtitle: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(e.email!),
                                              Text("${e.id}")
                                            ]),
                                      ],
                                    ),
                                    onTap: () {
                                      mc.goToViewUserProfile(e);
                                    },
                                  ))
                            ],
                          )),
                    ],
                  )),
          )),
    );
  }
}
