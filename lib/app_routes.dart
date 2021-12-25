import 'package:dietapp_v002/firestore/firestore_search_copy.dart';
import 'package:dietapp_v002/login/bindings/home_binding.dart';
import 'package:dietapp_v002/login/bindings/login_binding.dart';
import 'package:dietapp_v002/login/bindings/welcome_binding.dart';
import 'package:dietapp_v002/login/screens/home_view.dart';
import 'package:dietapp_v002/login/screens/login_view.dart';
import 'package:dietapp_v002/screens/homescreen.dart';
import 'package:dietapp_v002/screens/homescreen2.dart';
import 'package:dietapp_v002/screens/recipies_screen/veg_recipies.dart/veg_recipies_list/veg_recipie_each/veg_recipie_each.dart';
import 'package:dietapp_v002/screens/recipies_screen/veg_recipies.dart/veg_recipies_list/veg_recipie_each/veg_recipie_each_copy.dart';

import 'package:get/get.dart';

class AppRoutes {
  //static const initial = GetPage(name: "/", page: ()=>HomeScreen2())
  static final routes = [
    // Intitial Route
    GetPage(
      name: "/",
      page: () => HomeView(),
      //binding: HomeBinding(),
    ),

    // Login
    GetPage(
        name: "/loginScreen", page: () => LoginView(), binding: LoginBinding()),
    // Welcome
    

    GetPage(
        name: "/homeScreen2",
        page: () => HomeScreen2(),
        binding: WelcomeBinding()),
    //GetPage(name: "/", page: () => FhWebView()),
    GetPage(name: "/homeScreen", page: () => const HomeScreen()),
    GetPage(name: "/firestoreSearch2", page: () => FirestoreSearch2()),
    GetPage(name: "/vegRecipeEach2", page: () => VegRecipeEach2()),
    GetPage(name: "/vegRecipeEach", page: () => VegRecipeEach()),
  ];
}
