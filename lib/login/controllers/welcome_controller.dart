import 'package:dietapp_v002/login/controllers/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class WelcomeController extends GetxController {
  HomeController homeController = Get.find();
  late User user;
  @override
  void onInit() async {
    super.onInit();
    user = Get.arguments;
  }

  void logout() async {
    await GoogleSignIn().disconnect();
    await FirebaseAuth.instance.signOut();
  }
}
