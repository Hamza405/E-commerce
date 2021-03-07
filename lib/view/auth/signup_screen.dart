import 'package:e_c/view/auth/login_screen.dart';
import 'package:e_c/view/widgets/customText.dart';
import 'package:e_c/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.0,
      // ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
            top: (MediaQuery.of(context).size.height) * 0.1,
            left: (MediaQuery.of(context).size.width) * 0.05,
            right: (MediaQuery.of(context).size.width) * 0.05),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Welcome,',
                      fontSize: 24,
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width) * 0.2,
                    ),
                    GestureDetector(
                      onTap:()=> Get.off(LoginScreen()),
                        child: CustomText(
                        text: 'LogIn',
                        fontSize: 18,
                        color: Colors.lightBlue[800],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  // validator: (value) {
                  //   if (value == null) {
                  //     print('error');
                  //   }
                  // },
                  onSaved: (value) {
                    controller.name = value;
                  },
                  
                  decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Hamza Al Sheikh',
                      hintStyle: TextStyle(color: Colors.grey)),
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                  onSaved: (value) {
                    controller.email = value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'examper@exampel.com',
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                  onSaved: (value) {
                    controller.password = value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: '*******',
                      hintStyle: TextStyle(color: Colors.grey)),
                  obscureText: true,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        controller.signUp();
                      }
                    },
                    color: Colors.lightBlue[800],
                    padding: EdgeInsets.all(16),
                    
                      child: CustomText(
                        alignment: Alignment.center,
                        text: 'SIGN UP',
                        color: Colors.white,
                        fontSize: 14,
                      
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
