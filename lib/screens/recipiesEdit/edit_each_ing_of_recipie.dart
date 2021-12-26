import 'package:dietapp_v002/screens/homescreen2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EditEachIngOfRecipie extends StatefulWidget {
  const EditEachIngOfRecipie({Key? key}) : super(key: key);

  @override
  _EditEachIngOfRecipieState createState() => _EditEachIngOfRecipieState();
}

class _EditEachIngOfRecipieState extends State<EditEachIngOfRecipie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
InkWell(
                child: Icon(Icons.home),
                onTap: () {
                  Get.to(
                    HomeScreen2()
                  );
                }),
        ],
        
      ),
      body: Container(),
    );
  }
}
