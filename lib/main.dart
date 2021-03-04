
import 'package:e_c/util/binding.dart';
import 'package:e_c/view/auth/login_screen.dart';
import 'package:e_c/view/control_view.dart';
import 'package:e_c/view_model/cart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartViewModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      initialBinding: Binding(),
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.green,
          accentColor: Colors.green),
      home: ControlView(),
    );
  }
}

