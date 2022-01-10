import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/screens/recipiesEdit/models/each_ing_model.dart';
import 'package:dietapp_v002/screens/recipies_screen/veg_recipies.dart/veg_recipies_list/veg_recipie_each/veg_recipie_each.dart';

import 'package:dietapp_v002/screens/recipies_screen/veg_recipies.dart/veg_recipies_list/veg_recipie_each/veg_recipie_each_copy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class recipieSearchForEdit extends StatefulWidget {
  const recipieSearchForEdit({Key? key}) : super(key: key);

  @override
  _recipieSearchForEditState createState() => _recipieSearchForEditState();
}

class _recipieSearchForEditState extends State<recipieSearchForEdit> {
  ForEditingController fctrl = Get.put(ForEditingController());

  String name = ".c";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Card(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search), hintText: "Type food name.."),
              onChanged: (val) {
                setState(() {
                  name = val.toLowerCase();
                });
              },
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: (name != ".c" && name != null)
              ? FirebaseFirestore.instance
                  .collection("FoodData")
                  .where("searchFields", arrayContains: name)
                  .limit(12)
                  .snapshots()
              : FirebaseFirestore.instance
                  .collection("FoodData")
                  .where("searchFields", arrayContains: name)
                  .limit(12)
                  .snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];
                      var csName = data['names']['Common_name'].toString();
                      //var csImg = data["csImgURL"];
                      var protine = double.parse(
                          (data['nutriData']['Protine']).toStringAsFixed(1));
                      var netEnergy = double.parse((data['nutriData']
                                  ['Net Energy'])
                              .toStringAsFixed(1))
                          .toInt();

                      var check = data['fDetails']['sourceWebsite'];
                      var csValue;
                      var csItem;

                      if (check == "ICMR-NIN") {
                        csValue = 100;
                        csItem = "gms";
                      } else {
                        if (data['servingData']['defaultUnit'] == "serving") {
                          csValue = "";
                          csItem = "serving";
                        } else {
                          csValue = data['servingData']['defaultValue'];
                          csItem = data['servingData']['defaultUnit'];
                        }
                      }
                      return Container(
                        padding: EdgeInsets.only(
                          top: 5,
                        ),
                        child: ListTile(
                          title: SingleChildScrollView(
                            child: Text(
                              csName,
                              maxLines: 2,
                            ),
                          ),
                          subtitle: Text(
                            "Net Energy : ${netEnergy}kCal, Protine : ${protine}gms \n#Per $csValue $csItem",
                            //"Protine ${double.parse((data['Protine']).toStringAsFixed(2))} gms, Fat ${double.parse((data['Total Fat']).toStringAsFixed(2))} gms",
                            style: TextStyle(color: Colors.brown[700]),
                          ),
                          leading: CachedNetworkImage(
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(
                              color: Colors.white10,
                            ),
                            imageUrl: data["imgURL"]["img150"].toString(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          onTap: () {
                            fctrl.nm.value = csName;
                            Get.back();
                          },
                        ),
                      );
                    });
          },
        ),
      ),
    );
  }
}
