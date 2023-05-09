import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_api_appllication/bindings/hotel_bindings.dart';
import 'package:hotel_api_appllication/bindings/authentication_bindings.dart';
import 'package:hotel_api_appllication/bindings/main_bindings.dart';
import 'package:hotel_api_appllication/bindings/profile_bindings.dart';
import 'package:hotel_api_appllication/bindings/user_bindings.dart';
import 'package:hotel_api_appllication/screens/add_hotel.dart';
import 'package:hotel_api_appllication/screens/change_password.dart';
import 'package:hotel_api_appllication/screens/list_hotels_screen.dart';
import 'package:hotel_api_appllication/screens/list_users_screen.dart';
import 'package:hotel_api_appllication/screens/login_screen.dart';
import 'package:hotel_api_appllication/screens/main_screen.dart';
import 'package:hotel_api_appllication/screens/user_profile_screen.dart';
import 'package:hotel_api_appllication/screens/signup_screen.dart';
import 'package:hotel_api_appllication/screens/hotel_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/login',
      initialBinding: MainBindings(),
      getPages: [
        GetPage(
            name: '/',
            page: () => MainScreen(),
            bindings: [AuthenticationBindings()]),
        GetPage(name: '/login', page: () => LoginScreen(), bindings: [
          AuthenticationBindings(),
        ]),
        GetPage(name: '/signup', page: () => SignUpScreen(), bindings: [
          AuthenticationBindings(),
        ]),
        GetPage(
            name: '/profile',
            page: () => ProfileScreen(),
            bindings: [AuthenticationBindings(), ProfileBindings()]),
        GetPage(
            name: '/users',
            page: () => ListUsersScreen(),
            bindings: [AuthenticationBindings(), UserBindings()]),
        GetPage(
            name: '/profile/user',
            page: () => ProfileScreen(),
            bindings: [AuthenticationBindings(), ProfileBindings()]),
        GetPage(
            name: '/hotels',
            page: () => ListHotelsScreen(),
            bindings: [AuthenticationBindings(), HotelsBindings()]),
       GetPage(
            name: '/hotels/profile',
            page: () => HotelProfile(),
            bindings: [AuthenticationBindings(), HotelsBindings()]),
        GetPage(
            name: '/change-password',
            page: () => ChangePassword(),
            bindings: [AuthenticationBindings(), ProfileBindings()]),
        GetPage(
            name: '/add-hotel',
            page: () => AddNewHotel(),
            bindings: [AuthenticationBindings(), HotelsBindings()]),
      ],
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
