import 'package:e_c/view/widgets/customText.dart';
import 'package:e_c/view_model/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth/login_screen.dart';
class ProfileView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            child:SingleChildScrollView(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child:Row(
                      children: [
                        Container( padding: EdgeInsets.only(top:50),
                          width:120,
                          height:120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color:Colors.red,
                            // image: DecorationImage(
                            //   image: controller.s
                            // )
                          ),
                        ),
                        Column(
                          children: [
                            CustomText(
                              
                            )
                          ],
                        ),
                      ],
                    )
                  ),
                ],
              )
            )
          )
        );
      }
    );
  }

}