import 'package:dietapp_v002/screens/recipies_screen/veg_recipies.dart/veg_recipies_list/veg_recipie_each/tabViews/tab_view_ingredients.dart';
import 'package:dietapp_v002/screens/recipies_screen/veg_recipies.dart/veg_recipies_list/veg_recipie_each/tabViews/tab_view_nutrn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VegRecipeEach extends StatelessWidget {
  VegRecipeEach({Key? key}) : super(key: key);
  var FoodData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 25,
            title: Text("${FoodData['names']['Common_name'].toString()}"),
            bottom: const TabBar(
              tabs: [
                Text("Nutrition"),
                Text("Ingredients"),
                Text("Customise"),
              ],
              indicatorColor: Colors.deepOrange,
              indicatorWeight: 2,
              labelStyle: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          body: TabBarView(
            children: [TabViewNutrn(), TabViewIngredients(), Text("Coming soon")],
          ),
        ),
      ),
    );
  }
}
