import 'package:get/get.dart';
import 'package:hotel_api_appllication/controllers/hotels_controller.dart';

class HotelsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HotelController());
  }
}
