import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/customClasses/text_input_lowercase.dart';
import 'package:dietapp_v002/firestore_models/userModel/user_google.dart';
import 'package:dietapp_v002/firestore_models/userModel/user_profile.dart';
import 'package:dietapp_v002/models/fire_user_models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';

class UserProfileEdit extends StatefulWidget {
  UserProfileEdit({Key? key}) : super(key: key);

  @override
  State<UserProfileEdit> createState() => _UserProfileEditState();
}

class _UserProfileEditState extends State<UserProfileEdit> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    //Map userProfileMap = Get.arguments;
    // Map<String, dynamic> userProfileMap = {
    //   "displayName": "displayName",
    //   "photoURL": "photoURL",
    //   "userID": "userID",
    //   "userEmail": "userEmail",
    // };
    //Map userProfileMap = GetStorage().read("userProfileMap");
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
            
            var displayName = UserProfileModel.fromMap(data).displayName;
            var bioData = UserProfileModel.fromMap(data).bioData;
            var nativeLanguage = UserProfileModel.fromMap(data).nativeLanguage;
          var photoURL = UserWelcomeData.fromMap(data).googlePhotoURL;
          //var userID = "";
          var userEmail = UserWelcomeData.fromMap(data).googleEmail;
         
            
            
            
            return Scaffold(
              body: FormBuilder(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: ListView(
                  padding: EdgeInsets.only(left: 15, right: 20, top: 10),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      readOnly: true,
                      name: "userEmail",
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                      ),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                          fontSize: 19),
                      controller: TextEditingController(
                          text: userEmail),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // FormBuilderTextField(
                    //   valueTransformer: (value) {
                    //     if (value == null || value == "" || value.isEmpty) {
                    //       return null;
                    //     } else {
                    //       return "@$value";
                    //     }
                    //   },
                    //   onChanged: (value) async {
                    //     //print("user_id changed to $value");
                    //     await FirebaseFirestore.instance
                    //         .collection('users')
                    //         .where("userID", isEqualTo: "@$value")
                    //         //.limit(1)
                    //         .get()
                    //         .then((QuerySnapshot querySnapshot) {
                    //       if (querySnapshot.docs.length == 1) {
                    //         print("true");
                    //         isUserExists = true;
                    //         setState(() {
                    //           isUserExists = true;
                    //         });
                    //       }
                    //     });
                    //     // if (value != null && value != "" && !value.isEmpty) {

                    //     // }
                    //   },
                    //   style: TextStyle(fontSize: 17),
                    //   inputFormatters: [
                    //     LowerCaseTextFormatter(),
                    //   ],
                    //   decoration: InputDecoration(
                    //     icon: FaIcon(FontAwesomeIcons.userTag),
                    //     prefixText: "@",
                    //     labelText: "user_id",
                    //   ),
                    //   maxLength: 20,
                    //   validator: (value) {
                    //     RegExp userN = RegExp(r'(^[a-z]+[a-z0-9_]+[a-z0-9]+$)');
                    //     // if (isUserExists) {
                    //     //   return "user_id already exists";
                    //     // }
                    //     if (value == null || value == "") {
                    //       return null;
                    //     } else if (value.length < 4) {
                    //       return "";
                    //     } else if (value.length >= 4 && value.length < 8) {
                    //       return "Minimum 8 charactors";
                    //     } else if (!userN.hasMatch(value)) {
                    //       return "Enter valid username : [a-z][a-z/0-9/_][a-z/0-9]";
                    //     }
                    //   },
                    //   name: "userID",
                    //   controller: TextEditingController(
                    //       text:
                    //           userProfileMap["userID"].toString().substring(1)),
                    // ),
                    FormBuilderTextField(
                      valueTransformer: (value) {
                        if (value == null || value == "") {
                          return displayName;
                        } else {
                          return value;
                        }
                      },
                      maxLength: 25,
                      validator: (value) {
                        RegExp userD =
                            RegExp(r'(^[a-zA-Z]+[a-zA-Z0-9 ]+[a-zA-Z0-9]$)');
                        if (value == null || value == "") {
                          return "";
                        } else if (value.length < 6) {
                          return "Minimum 6 characters";
                        } else if (!userD.hasMatch(value)) {
                          return "Enter Valid Name : [A-Z/a-z][space][A-Z/a-z/0-9]";
                        }
                      },
                      decoration: InputDecoration(
                          icon: Icon(FontAwesomeIcons.fileSignature),
                          labelText: "Display Name"),
                      name: "displayName",
                      controller: TextEditingController(
                          text: displayName),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FormBuilderDropdown(
                        initialValue: "English",
                        decoration: InputDecoration(
                            icon: Icon(Icons.language),
                            labelText: "Native language"),
                        name: "nativeLanguage",
                        items: [
                          //lang.map((gender) => DropdownMenuItem(child: "$e")).toList<DropdownMenuItem<dynamic>>()
                          DropdownMenuItem(
                            child: Text("English"),
                            value: "English",
                          ),
                          DropdownMenuItem(
                            child: Text("Hindi"),
                            value: "Hindi",
                          ),
                          DropdownMenuItem(
                            child: Text("Telugu"),
                            value: "Telugu",
                          ),
                          DropdownMenuItem(
                            child: Text("Tamil"),
                            value: "Tamil",
                          ),
                          DropdownMenuItem(
                            child: Text("Malayalam"),
                            value: "Malayalam",
                          ),
                          DropdownMenuItem(
                            child: Text("Kannada"),
                            value: "Kannada",
                          ),
                          DropdownMenuItem(
                            child: Text("Marati"),
                            value: "Marati",
                          ),
                          DropdownMenuItem(
                            child: Text("Bengali"),
                            value: "Bengali",
                          ),
                          DropdownMenuItem(
                            child: Text("Urdu"),
                            value: "Urdu",
                          ),
                        ]),
                    FormBuilderTextField(
                      
                      name: "bioData",
                      maxLines: 6,
                      maxLength: 200,
                      decoration: InputDecoration(labelText: "Bio"),
                    )
                  ],
                ),
              ),
              appBar: AppBar(
                title: Text("Edit profile"),
                actions: [
                  ElevatedButton(
                      onPressed: () async {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          GetStorage().write(
                              "userProfileMap", _formKey.currentState!.value);
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .update({
                            "profileData": _formKey.currentState!.value,
                            //"userID": _formKey.currentState!.value["userID"]
                          });
                          Get.back();
                          Get.snackbar(
                            "Profile details saved",
                            "",
                            duration: Duration(seconds: 1),
                          );
                          //Get.back();
                        } else {
                          Get.snackbar("Something went wrong",
                              "Profile details not saved",
                              duration: Duration(seconds: 1));
                        }
                      },
                      child: Text(
                        "Save  ",
                        textScaleFactor: 1.2,
                        style: TextStyle(),
                      ))
                ],
              ),
            );
          }
          return Text("Unable to load data");
        });
  }
}
