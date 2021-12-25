import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/firestore_models/userModel/user_google.dart';
import 'package:dietapp_v002/firestore_models/userModel/user_profile.dart';
import 'package:dietapp_v002/login/controllers/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class WelcomeController extends GetxController {
  HomeController homeController = Get.find();
  late User user;
  @override
  void onInit() async {
    user = Get.arguments;
    GetStorage().write("uid", user.uid);
    var userGoogle = UserWelcomeData(
      UID: user.uid,
      googleDisplayName: user.displayName,
      googleEmail: user.email,
      googlePhotoURL: user.photoURL,
      googleEmailVerified: user.emailVerified,
      googleIsAnonymous: user.isAnonymous,
      googlePhoneNumber: user.phoneNumber,
      googleCreationTime: user.metadata.creationTime,
      googleLastSignInTime: user.metadata.lastSignInTime,
    ).toMap();
    var profileData = UserProfileModel(
      photoURL: user.photoURL,
      displayName: user.displayName,
    ).toMap();
    Map<String,dynamic> welcomeMap = {}..addAll(userGoogle)..addAll(profileData);

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (!documentSnapshot.exists) {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .set(welcomeMap);
      } 
    });
    super.onInit();
  }

  void logout() async {
    await GoogleSignIn().disconnect();
    await FirebaseAuth.instance.signOut();
  }
}
