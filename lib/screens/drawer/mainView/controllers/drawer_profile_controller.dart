import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/firestore_models/firestore_instances.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DrawerProfileController extends GetxController {
  var isFireProfileExist = true.obs;
  var profileData;
  @override
  void onReady() {
    
    try {
      profileData = FirestoreInstance().userDocumentReference;
    } catch (e) {}

    super.onReady();
  }
}
