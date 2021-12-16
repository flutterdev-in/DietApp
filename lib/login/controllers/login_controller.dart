import 'package:dietapp_v002/login/controllers/home_controller.dart';
import 'package:dietapp_v002/login/custom_fullscreen_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  HomeController homeController = Get.find();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  void login() async {
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    try {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
          
      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await firebaseAuth.signInWithCredential(oAuthCredential);

      CustomFullScreenDialog.cancelDialog();
    } catch (error) {
      Get.snackbar("Error", "$error");
    }
  }
}
