import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
