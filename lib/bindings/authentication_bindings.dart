import 'package:get/get.dart';

import '../controllers/authentication_controller.dart';

class AuthenticationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationController());
  }
}
