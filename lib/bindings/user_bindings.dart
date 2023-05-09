import 'package:get/get.dart';
import 'package:hotel_api_appllication/controllers/users_controller.dart';

class UserBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
  }
}
