import 'package:e_c/view/auth/login_screen.dart';
import 'package:e_c/view/control_view.dart';
import 'package:e_c/view/widgets/customText.dart';
import 'package:e_c/view_model/auth_view_model.dart';
import 'package:e_c/view_model/controle_view_model.dart';
import 'package:e_c/view_model/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_view.dart';
import 'details_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var width = MediaQuery.of(context).size.width;

    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Container(
              width: double.infinity,
              height: height,
              padding: EdgeInsets.only(
                  top: height * 0.05,
                  bottom: height * 0.05,
                  right: height * 0.025,
                  left: height * 0.025),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.075,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200]),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          )),
                    ),
                  ),
                  SizedBox(height: height * 0.025),
                  Container(
                    height: height * 0.05,
                    child: CustomText(
                      text: 'Categories',
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: height * 0.025),
                  _categoriesListView(height),
                  SizedBox(height: height * 0.045),
                  Container(
                    height: height * 0.05,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Best selling',
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          CustomText(
                            text: 'See All',
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ]),
                  ),
                  SizedBox(height: height * 0.025),
                  Expanded(child: _productsListView(height, width))
                ],
              ),
            )),
    );
  }

  Widget _categoriesListView(var height) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => Container(
        height: height * 0.130,
        width: double.infinity,
        child: ListView.separated(
            // itemCount:5,
            itemCount: controller.categoryModel.length,
            separatorBuilder: (context, index) => SizedBox(
                  width: 25,
                ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: height * 0.075,
                    // child: Image.asset('assets/shoes.png',fit: BoxFit.fill,),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/loading1.gif'),
                      height: height * 0.075,
                      image:
                          NetworkImage(controller.categoryModel[index].image),
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: height * 0.025),
                  Container(
                      height: height * 0.03,
                      child: Text(controller.categoryModel[index].name),
                      alignment: Alignment.center),
                ],
              );
            }),
      ),
    );
  }

  Widget _productsListView(var height, var width) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => Container(
        height: height * 0.40,
        width: double.infinity,
        child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
                  width: 25,
                ),
            itemCount: controller.productModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap:()=> Get.to(DetailsView(model:controller.productModel[index])),
                child: Container(
                  height: height * 0.40,
                  width: width * 0.35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: height * 0.25,
                        child: FadeInImage(
                          placeholder: AssetImage(
                            'assets/loading1.gif',
                          ),
                          width: double.infinity,
                          height: height * 0.25,
                          image: NetworkImage(
                              controller.productModel[index].image),
                          fit: BoxFit.fill,
                        ),
                        // Image.network(controller.productModel[index].image, fit: BoxFit.fill)
                        // child: Image.asset('assets/watch.jpg', fit: BoxFit.fill),
                      ),
                      SizedBox(height: 0.025),
                      Container(
                          height: height * 0.025,
                          width: width * 0.4,
                          child: CustomText(
                            text: controller.productModel[index].name,
                            // alignment:Alignment.bottomLeft,
                          )),
                      SizedBox(height: 0.025),
                      Container(
                          height: height * 0.025,
                          width: width * 0.4,
                          child: CustomText(
                            text: controller.productModel[index].descreption,
                            color: Colors.grey,
                            // alignment:Alignment.bottomLeft,
                          )),
                      SizedBox(height: 0.025),
                      Container(
                          height: height * 0.025,
                          width: width * 0.4,
                          child: CustomText(
                            color: Colors.green,
                            text:
                                '\$ ${controller.productModel[index].price.toString()}',
                            // alignment:Alignment.bottomLeft,
                          )),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
