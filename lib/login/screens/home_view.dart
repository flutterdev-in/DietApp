import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({Key? key}) : super(key: key);

//   @override
//   _HomeViewState createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   @override
//   void initState() async {
//     try {
//       FirebaseAuth.instance.authStateChanges().listen((User? user) {

//         if (user == null) {
//           Get.offAllNamed("/loginScreen");
//         } else {
//           Get.offAllNamed("/homeScreen2",
//               arguments: FirebaseAuth.instance.currentUser);
//         }
//       });
//     } catch (e) {
//       print("$e");
//     }

//     // bool isSignIn = FirebaseAuth.instance.currentUser != null;
//     // if (isSignIn) {
//     //   Get.offAllNamed("/homeScreen2",
//     //       arguments: FirebaseAuth.instance.currentUser);
//     // } else {
//     //   //Get.to(LoginView());
//     //   Get.offAllNamed("/loginScreen");
//     // }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Loading"),
      ),
    );
  }
}
