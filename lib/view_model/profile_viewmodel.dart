import 'package:e_c/model/user.dart';
import 'package:e_c/util/const.dart';
import 'package:e_c/util/local_storge.dart';
import 'package:e_c/view_model/controle_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.find();

  UserModel _userModel;
  UserModel get userModel => _userModel;

  @override
  void onInit(){
    super.onInit();
    getCurrentUser();
  }

  signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUserData();
  }

  getCurrentUser()async{
    await localStorageData.getUser.then((value) {
      _userModel = value;
    } );
    update();
  }
}
