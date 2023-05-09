import 'package:get/get.dart';
import 'package:hotel_api_appllication/controllers/profile_controller.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
