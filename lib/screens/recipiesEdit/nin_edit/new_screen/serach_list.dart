import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/new_edit.dart/search_edit.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/new_screen/new_0uodated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';

class SearchForUpdate extends StatelessWidget {
  SearchForUpdate({Key? key}) : super(key: key);
  var gc = Get.put(SearchForEditController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        //shrinkWrap: true,
        children: [
          SizedBox(
            height: 50,
          ),
          TextField(
            autofocus: true,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: "Type food name.."),
            onChanged: (val) {
              gc.name.value = val;
              //await Duration(milliseconds: 500);
            },
          ),
          SizedBox(
            height: 30,
          ),
          GFButton(
            onPressed: () {
              Get.to(New0UpdatedList(), arguments: gc.name.value);
            },
            text: "Search for updation",
          ),
        ],
      ),
    );
  }
}

class SearchForEditController extends GetxController {
  var name = "".obs;
  var mD = {}.obs;
}
