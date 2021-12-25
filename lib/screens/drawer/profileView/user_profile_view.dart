import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/firestore_models/userModel/user_google.dart';
import 'package:dietapp_v002/firestore_models/userModel/user_profile.dart';
import 'package:dietapp_v002/models/fire_user_models.dart';
import 'package:dietapp_v002/screens/drawer/profileView/user_profile_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserProfileView extends StatelessWidget {
  UserProfileView({Key? key}) : super(key: key);
  //UserProfileController c = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    // Map userProfileMap =
    //     GetStorage().read("userProfileMap"); // from Drawer container
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<DocumentSnapshot>(
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
              var displayName;
              var photoURL = UserGoogle.fromMap(data).googlePhotoURL;
              var userID = "";
              var userEmail = UserGoogle.fromMap(data).googleEmail;
              var userIDorEmail;
              if (data.containsKey("profileData")) {
                try {
                  displayName = UserProfileModel.fromMap(data).displayName;
                  //photoURL = UserProfileModel.fromMap(data).photoURL;
                  userID = UserProfileModel.fromMap(data).userID;
                  userIDorEmail = userID;
                } catch (e) {
                  displayName = UserGoogle.fromMap(data).googleDisplayName;
                  //photoURL = UserGoogle.fromMap(data).googlePhotoURL;
                  userIDorEmail = userEmail;
                }
              } else {
                displayName = UserGoogle.fromMap(data).googleDisplayName;
                //photoURL = UserGoogle.fromMap(data).googlePhotoURL;
                userIDorEmail = userEmail;
              }

              Map<String, dynamic> userProfileMap = {
                "displayName": displayName,
                "photoURL": photoURL,
                "userID": userID,
                "userEmail": userEmail,
              };
              //c.userProfileMap.value = userProfileMap;
              GetStorage().write("userProfileMap", userProfileMap);

              return Container(
                padding: EdgeInsets.only(top: 15),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          foregroundImage:
                              NetworkImage(userProfileMap["photoURL"]),
                          minRadius: 60,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              userProfileMap["displayName"],
                              textScaleFactor: 1.8,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            // SizedBox(
                            //   height: 4,
                            // ),
                            Text(
                              userProfileMap["userEmail"],
                              textScaleFactor: 1.2,
                            ),
                            Text(userProfileMap["userID"]),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      child: Container(
                        child: Icon(Icons.edit),
                        height: 50,
                        width: 60,
                      ),
                      onTap: () {
                        Get.to(() => UserProfileEdit(),
                            arguments: userProfileMap);
                      },
                    ),
                  ],
                ),
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
          }),
    );
  }
}
