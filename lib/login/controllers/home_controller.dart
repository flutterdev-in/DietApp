import 'package:dietapp_v002/login/screens/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeController extends GetxController {
  late GoogleSignIn googleSignIn;
  var isSignIn = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() async {
    googleSignIn = GoogleSignIn();
    ever(isSignIn, handleAuth);
    isSignIn.value = await FirebaseAuth.instance.currentUser != null;
    FirebaseAuth.instance.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });
    super.onInit();
  }

  void handleAuth(isLoggedIn) {
    if (isLoggedIn) {
      
      Get.offAllNamed("/homeScreen2", arguments: firebaseAuth.currentUser);
    } else {
      //Get.to(LoginView());
      Get.offAllNamed("/loginScreen");
    }
  }
}
