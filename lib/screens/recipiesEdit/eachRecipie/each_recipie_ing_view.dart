import 'package:dietapp_v002/screens/recipiesEdit/eachRecipie/controllers/arguments_controller.dart';
import 'package:dietapp_v002/screens/recipiesEdit/eachRecipie/eachRecipieSubViews/stream_listview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Previous Screen -- recipies_listview.dart

class EachRecipieIngView extends StatelessWidget {
  EachRecipieIngView({Key? key}) : super(key: key);
    
  
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: StreamListViewIngs(),
      ),
    );
  }
}
