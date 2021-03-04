import 'package:e_c/view/widgets/customText.dart';
import 'package:e_c/view_model/cart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CartView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      padding: EdgeInsets.all(8),
      child: Scaffold(
        body: Column(
          
          children: [
            Expanded(
                    child: GetBuilder<CartViewModel>(
                      init:Get.find(),
                      builder: (controller) {
                        return Container(
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                              
                              height: height*0.025,
                            ),
                  itemCount: controller.cartProductModel.length,
                  itemBuilder: (context, index) => Container(
                        height: height*0.20 ,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(width: width*0.4,child: Image.network(controller.cartProductModel[index].image,fit: BoxFit.fill,)),
                            SizedBox(width: width*0.1,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(text:controller.cartProductModel[index].name,fontSize: 20,),
                                   CustomText(text:controller.cartProductModel[index].price,color: Colors.green,),
                                   Container(
                                     
                                     height: height*0.05,
                                     color: Colors.grey.shade200,
                                     width: width*0.3,
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       children: [
                                         GestureDetector(child: Icon(Icons.add),onTap:(){
                                          controller.increasQuantity(index);
                                         } ,),
                                         CustomText(text:controller.cartProductModel[index].quantity.toString(),fontSize: 16,alignment: Alignment.center,),
                                         GestureDetector(onTap: (){
                                           controller.decreasQuantity(index);
                                         },child: Container(padding: EdgeInsets.only(bottom:width*0.01),child: Icon(Icons.minimize_outlined))),
                                       ],
                                     ),
                                   )
                                ],
                              ),
                            )


                          ],
                        ),
                  )
                ),
              );
                      }
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
                          text: 'Total',
                          color:Colors.grey[800],
                        ),
                        GetBuilder<CartViewModel>(
                          
                          builder: (controller) {
                            return CustomText(text: '${controller.totalPrice} \$',color: Colors.green,);
                          }
                        )
                      ],
                    ),
                    Container(
                      width: width*0.3,
                      child: FlatButton(
                        
                          shape: RoundedRectangleBorder(
                            
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                        },
                          color: Colors.green,
                          padding: EdgeInsets.all(16),
                          child: CustomText(
                            alignment: Alignment.center,
                            text: 'Check out',
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                    ),
                    
                  ],
                ),
              )
          ],)
         
      
      ),
    );
  }

}