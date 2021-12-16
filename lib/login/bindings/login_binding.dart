import 'package:dietapp_v002/login/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(
      LoginController(),
      //permanent: true,
    );
  }
}
