import 'package:e_c/view/auth/login_screen.dart';
import 'package:e_c/view/widgets/customText.dart';
import 'package:e_c/view_model/auth_view_model.dart';
import 'package:e_c/view_model/controle_view_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class ControlView extends GetWidget<AuthViewModel>{
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return (Get.find<AuthViewModel>().user == null ?LoginScreen():
        GetBuilder<ControlViewModel>(
          init: ControlViewModel(),
          builder:(controller) => Scaffold(
            bottomNavigationBar:_bottomNavigationBar() ,
          body:controller.currentScreen,
          
          
      ),
        ));
    });
  }

  Widget _bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find(),
      builder: (controller) =>BottomNavigationBar(
            elevation: 3,
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.home),
                activeIcon: CustomText(text:'Home',color: Colors.lightBlue[800],alignment: Alignment.center,fontWeight: FontWeight.bold),
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/cartt.png')),
                  activeIcon: CustomText(text:'Cart',color: Colors.lightBlue[800],alignment: Alignment.center,fontWeight: FontWeight.bold),
                  label: ''),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: '',
                activeIcon: CustomText(text:'Account',color: Colors.lightBlue[800],alignment: Alignment.center,fontWeight: FontWeight.bold,),
              ),
            ],
            currentIndex: controller.navigatorValue,
            onTap: (index) {
              controller.changeSelectedValue(index);
            },
          ),
    
    );
  }
}