import 'package:e_c/model/user.dart';
import 'package:e_c/util/const.dart';
import 'package:e_c/util/local_storge.dart';
import 'package:e_c/view/widgets/customText.dart';
import 'package:e_c/view_model/controle_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.find();

  UserModel _userModel;
  UserModel get userModel => _userModel;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
   

  @override
  void onInit(){
    super.onInit();
    getCurrentUser();
  }

  signOut() async {
    // GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    localStorageData.deleteUserData();
   
  }

  getCurrentUser()async{
    _loading.value = true; 
    await localStorageData.getUser.then((value) {
      _userModel = value;
    } );
    _loading.value = false;
    update();
  }
}
