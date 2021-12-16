import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

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
