
import 'dart:convert';

import 'package:e_c/model/user.dart';
import 'package:e_c/util/const.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController{

  Future<UserModel> get getUser async {
   try{
      UserModel userModel = await _getUserData();
      if(userModel == null) return null;
      return userModel;
   }catch(e){
     print(e.toString());
     return null;
   }
  }

  _getUserData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var value = prefs.getString(CASH_USER_DATA);
    return UserModel.fromJson(json.decode(value));
  }

  setUserData(UserModel model)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(CASH_USER_DATA, json.encode(model.toJson()));

  }

  void deleteUserData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}