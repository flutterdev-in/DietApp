import 'package:dietapp_v002/login/screens/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


// class HomeController extends GetxController {
  
//   @override
//   void onInit() {
//     bool isSignIn =   FirebaseAuth.instance.currentUser != null;
// if (isSignIn) {
//       Get.offAllNamed("/homeScreen2", arguments: FirebaseAuth.instance.currentUser);
//     } else {
//       //Get.to(LoginView());
//       Get.offAllNamed("/loginScreen");
//     }

    
//     super.onInit();
//   }
// }




class HomeController extends GetxController {
  late GoogleSignIn googleSignIn;
  var isSignIn = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() async {
    // isSignIn.value = await FirebaseAuth.instance.currentUser != null;
    // if (isSignIn.value) {
    //   Get.offAllNamed("/homeScreen2", arguments: firebaseAuth.currentUser);
    // } else {
    //   //Get.to(LoginView());
    //   Get.offAllNamed("/loginScreen");
    // }

    googleSignIn = GoogleSignIn();
    //handleAuth(isSignIn.value);

    ever(isSignIn, handleAuth);
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
