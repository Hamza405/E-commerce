import 'package:e_c/model/cart_prouct_model.dart';
import 'package:e_c/model/product.dart';
import 'package:e_c/view/widgets/customText.dart';
import 'package:e_c/view_model/cart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  final ProductModel model;
  DetailsView({this.model});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: width,
              height: height * 0.35,
              child: FadeInImage(
                placeholder: AssetImage('assets/loading1.gif'),
                width: double.infinity,
                image: NetworkImage(model.image),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.05),
                      child: CustomText(
                        text: model.name,
                        fontSize: 26,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            height: height * 0.06,
                            padding: EdgeInsets.all(8),
                            width: width * 0.40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(text: 'size'),
                                CustomText(text: 'xl')
                              ],
                            )),
                        Container(
                            height: height * 0.06,
                            padding: EdgeInsets.all(8),
                            width: width * 0.40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(text: 'Color'),
                                Container(
                                  padding: EdgeInsets.all(12),
                                  width: width * 0.07,
                                  height: height * 0.035,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                      color: model.color),
                                )
                              ],
                            ))
                      ],
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: width * 0.05),
                      child: CustomText(
                        text: 'Details',
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: width * 0.05, right: width * 0.05),
                      child: CustomText(
                        text: model.descreption,
                        fontSize: 18,
                        height: 2,
                        alignment: Alignment.topLeft,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: width*0.05,right: width*0.05 ,top: height*0.025,bottom:  height*0.025),
              height: height * 0.13,
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomText(
                        text: 'Price',
                        color:Colors.grey[400],
                      ),
                      CustomText(text: '${model.price} \$',color: Colors.green,)
                    ],
                  ),
                  GetBuilder<CartViewModel>(
                    init: Get.find(),
                    builder: (controller) {
                      return Container(
                        width: width*0.3,
                        child: FlatButton(
                          
                            shape: RoundedRectangleBorder(
                              
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              controller.addproduct(
                                CartProductModel(
                                  name:model.name,
                                  image:model.image,
                                  price:model.price,
                                  quantity: 1,
                                  productID: model.productID
                                )
                              );
                          },
                            color: Colors.green,
                            padding: EdgeInsets.all(16),
                            child: CustomText(
                              alignment: Alignment.center,
                              text: 'ADD',
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                      );
                    }
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
