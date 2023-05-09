import 'package:get/get.dart';
import 'package:hotel_api_appllication/controllers/profile_controller.dart';
import 'package:hotel_api_appllication/models/hotel.dart';
import 'package:hotel_api_appllication/models/user.dart';

class MainController extends GetxService {
  void goToMainScreen() {
    Get.toNamed('/');
  }

  void goToLoginScreen() {
    Get.toNamed('/login');
  }

  void goToSignUpScreen() {
    Get.toNamed('/sign-up');
  }

  void goToUsersScreen() {
    Get.toNamed('/users');
  }

  void goToHotelsScreen() {
    Get.toNamed('/hotels');
  }

  void goToViewMyProfile() {
    Get.toNamed('/profile');
  }

  void goToViewUserProfile(User u) {
    Get.toNamed('/profile/user', arguments: u);
  }

  void viewHotel(Hotel h) {
    Get.toNamed("/hotels/profile", arguments: h);
  }

  void goTOChangePasswordScreen() {
    Get.toNamed("/change-password");
  }

  void goToAddHotelScreen() {
    Get.toNamed("/add-hotel");
  }
}
