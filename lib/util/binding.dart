
import 'package:e_c/util/local_storge.dart';
import 'package:e_c/view_model/auth_view_model.dart';
import 'package:e_c/view_model/cart_viewmodel.dart';
import 'package:e_c/view_model/controle_view_model.dart';
import 'package:e_c/view_model/home_view_model.dart';
import 'package:e_c/view_model/profile_viewmodel.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => ProfileViewModel());
    
  }

}