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
        return controller.loading.value == true ? Center(child: CircularProgressIndicator(),): Scaffold(
          body: Container(
            padding: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            child:SingleChildScrollView(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top:30),
                   width:double.infinity,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container( 
                          width: 100,
                          height:100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color:Colors.lightBlue[800],
                            image: DecorationImage(
                              image: AssetImage('assets/pf.jpg'),
                              fit: BoxFit.fill
                            )
                          ),
                        ),
                       
                        Container(
                          child: Column(
                            children: [
                              CustomText(
                                text: 'Hamza Al Sheikh',
                                color: Colors.black,
                                fontSize: 28,
                              ),
                              SizedBox(height: 10,),
                              CustomText(
                                text: 'hamza@hamza.com',
                                color: Colors.black,
                                fontSize: 18,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: FlatButton(
                      child: ListTile(
                        title: CustomText(
                          text:'Edit Profile'
                        ),
                        leading: Icon(Icons.edit,color: Colors.lightBlue[800],),
                        trailing: Icon(Icons.navigate_next,color: Colors.black,),
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    child: FlatButton(
                      child: ListTile(
                        title: CustomText(
                          text:'Address'
                        ),
                        leading: Icon(Icons.location_city,color: Colors.lightBlue[800],),
                        trailing: Icon(Icons.navigate_next,color: Colors.black,),
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    child: FlatButton(
                      child: ListTile(
                        title: CustomText(
                          text:'Order History'
                        ),
                        leading: Icon(Icons.history,color: Colors.lightBlue[800],),
                        trailing: Icon(Icons.navigate_next,color: Colors.black,),
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    child: FlatButton(
                      child: ListTile(
                        title: CustomText(
                          text:'Cards'
                        ),
                        leading: Icon(Icons.crop_landscape_outlined,color: Colors.lightBlue[800],),
                        trailing: Icon(Icons.navigate_next,color: Colors.black,),
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    child: FlatButton(
                      child: ListTile(
                        title: CustomText(
                          text:'Notification'
                        ),
                        leading: Icon(Icons.notifications,color: Colors.lightBlue[800],),
                        trailing: Icon(Icons.navigate_next,color: Colors.black,),
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    child: FlatButton(
                      onPressed: (){
                        controller.signOut();
                        Get.offAll(LoginScreen());
                      },
                      child: ListTile(
                        title: CustomText(
                          text:'Log Out'
                        ),
                        leading: Icon(Icons.logout,color: Colors.lightBlue[800],),
                        
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),

                ],
              )
            )
          )
        );
      }
    );
  }

}