import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/firestore_models/userModel/user_google.dart';
import 'package:dietapp_v002/firestore_models/userModel/user_profile.dart';
import 'package:dietapp_v002/login/controllers/welcome_controller.dart';
import 'package:dietapp_v002/models/fire_user_models.dart';
import 'package:dietapp_v002/screens/drawer/profileView/user_profile_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DrawerMainProfileContainer extends StatelessWidget {
  DrawerMainProfileContainer({Key? key}) : super(key: key);
  //UserProfileController c = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirestoreUserModel().userDocStrem,
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot> documentSnapshot) {
        if (documentSnapshot.hasError) {
          return const Text('Error');
        }

        if (documentSnapshot.hasData && !documentSnapshot.data!.exists) {
          return const Text("No records found");
        }

        if (documentSnapshot.hasData && documentSnapshot.data!.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data!.data() as Map<String, dynamic>;
          var displayName = UserProfileModel.fromMap(data).displayName;;
          var photoURL = UserWelcomeData.fromMap(data).googlePhotoURL;
          //var userID = "";
          var userEmail = UserWelcomeData.fromMap(data).googleEmail;
         

          return ListTile(
            tileColor: Colors.black87,
            title: Text(
              displayName,
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.white),
            ),
            leading: CircleAvatar(
              foregroundImage: NetworkImage(photoURL),
            ),
            subtitle: Text(
              userEmail,
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Get.to(() => UserProfileView());
            },
          );
        }

        return ListTile(
          tileColor: Colors.black87,
          title: Text(
            "Loading",
            textScaleFactor: 1.2,
            style: TextStyle(color: Colors.white),
          ),
          leading: Icon(
            Icons.autorenew,
          ),
          subtitle: Text(
            "Please wait",
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}
