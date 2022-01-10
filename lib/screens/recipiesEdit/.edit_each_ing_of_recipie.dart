import 'package:dietapp_v002/screens/homescreen2.dart';
import 'package:dietapp_v002/screens/recipiesEdit/firestore_search_copy.dart';
import 'package:dietapp_v002/screens/recipiesEdit/models/each_ing_model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';

// class EditEachIngOfRecipie extends StatelessWidget {
//   EditEachIngOfRecipie({Key? key}) : super(key: key);
//   List argList = Get.arguments;

//   @override
//   Widget build(BuildContext context) {
//     ForEditIng forEditIng = ForEditIng.fromList(argList);
//     List listBowls = forEditIng.listBowls(forEditIng.servingData);
//     return Scaffold(
//       appBar: AppBar(),
//       body: ListView(
//         children: [
// ListTile(
//   title: Text("Original Ingredient"),
//   subtitle: Text(forEditIng.realValues),
// ),
// ListTile(
//   title: Text("Current Ingredient"),
//   subtitle: Text(forEditIng.oldValues),
// ),
//         ],
//       ),
//     );
//   }
// }

class EditEachIngOfRecipie extends StatefulWidget {
  const EditEachIngOfRecipie({Key? key}) : super(key: key);

  @override
  _EditEachIngOfRecipieState createState() => _EditEachIngOfRecipieState();
}

class _EditEachIngOfRecipieState extends State<EditEachIngOfRecipie> {
  ForEditingController fctrl = Get.put(ForEditingController());
  List argList = Get.arguments;
  @override
  Widget build(BuildContext context) {
    ForEditIng forEditIng = ForEditIng.fromList(argList);
    List listBowls = forEditIng.listBowls(forEditIng.servingData);
    EachIngModel ingModel = EachIngModel.fromMap(forEditIng.eachIngMap);
    var nwUnit = ingModel.NwUnit;
    if (nwUnit != null && listBowls.contains(nwUnit)) {
      listBowls.remove(nwUnit);
      listBowls.insert(0, nwUnit);
    }
    var val = 1.obs;

    fctrl.nm.value = forEditIng.iCodeName;

    //var nmm = nm.obs;

    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
                child: Icon(Icons.home),
                onTap: () {
                  Get.to(HomeScreen2());
                }),
          ],
        ),
        body: ListView(
          children: [
            ListTile(
              isThreeLine: true,
              title: Text("Original Ingredient"),
              subtitle: Text(forEditIng.realValues),
            ),
            ListTile(
              title: Text("Current Ingredient"),
              subtitle: Text(forEditIng.oldValues),
            ),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Update Ingredient",
                textScaleFactor: 1.5,
              ),
            ),
            Center(
              child: SizedBox(
                width: 200,
                height: 100,
                child: CupertinoPicker(
                  diameterRatio: 100,
                  itemExtent: 50,
                  onSelectedItemChanged: (index) {},
                  children: listBowls
                      .map((bowlType) => Center(
                            child: Text(bowlType),
                          ))
                      .toList(),
                ),
              ),
            ),
            InkWell(
              child: Container(
                width: 20,
                height: 20,
                color: Colors.amber,
                child: Obx(() => Text("${val.value}")),
              ),
              onTap: () {
                Get.dialog(Center(
                  child: Container(
                    color: Colors.white,
                    width: 300,
                    height: 500,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: [
                        GestureDetector(
                          child: Text("1"),
                          onTap: () {
                            val.value = 2;
                            Get.back();
                          },
                        ),
                        Text("1"),
                        Text("1"),
                      ],
                    ),
                  ),
                ));
              },
            ),
            ListTile(
              title: Obx(() => Text(fctrl.nm.value)),
              onTap: () {
                Get.to(recipieSearchForEdit());
              },
            ),
            ListTile(
              title: Text(forEditIng.realValues),
            )
          ],
        ));
  }
}
