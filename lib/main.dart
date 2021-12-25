import 'package:dietapp_v002/app_routes.dart';
import 'package:dietapp_v002/firestore.dart';
import 'package:dietapp_v002/firestore_user.dart';
import 'package:dietapp_v002/login/bindings/home_binding.dart';
import 'package:dietapp_v002/login/screens/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

//import 'firestore/firestore_search.dart';

Future<void> main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //HomeBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      initialBinding: HomeBinding(),
      theme: ThemeData(primaryColor: Colors.pink),
      title: 'DietApp',
      initialRoute: "/",
      //FirebaseAuth.instance.currentUser != null?  "/loginScreen" : "/welcomeScreen",
      //home: HomeView2(),
      getPages: AppRoutes.routes,

      //home: AnimatedContainerFlex(),
    );
  }
}
