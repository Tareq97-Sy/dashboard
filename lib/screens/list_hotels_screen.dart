import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_api_appllication/controllers/hotels_controller.dart';
import 'package:hotel_api_appllication/controllers/main_controller.dart';

class ListHotelsScreen extends StatelessWidget {
  ListHotelsScreen({super.key});
  final HotelController hc = Get.find<HotelController>();
  final MainController mc = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Obx(() => hc.isClicked == true
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              hc.getHotels();
                            },
                            child: Text("Get Hotels")),
                      ),
                      Expanded(
                          flex: 3,
                          child: ListView(
                            children: [
                              ...hc.hotels!.map((h) => ListTile(
                                    leading: CircleAvatar(
                                        backgroundImage:
                                            h.photos.elementAt(0).image),
                                    title: Row(
                                      children: [
                                        Text("${h.id}"),
                                        Text(h.name!),
                                      ],
                                    ),
                                    subtitle: Text(h.email!),
                                    onTap: () {
                                      mc.viewHotel(h);
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
