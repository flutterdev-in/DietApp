import 'package:dietapp_v002/login/controllers/home_controller.dart';
import 'package:dietapp_v002/login/controllers/welcome_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeView extends StatelessWidget {
  WelcomeView({Key? key}) : super(key: key);
  WelcomeController welcomeController = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'User Profile',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            SizedBox(
              height: 16,
            ),
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(welcomeController.user.photoURL!),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Display Name : ${welcomeController.user.displayName}',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              welcomeController.user.email!,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 120),
              child: ElevatedButton(
                child: Text(
                  "Logout",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                onPressed: () {
                  welcomeController.logout();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
