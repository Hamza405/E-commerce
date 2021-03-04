import 'dart:ui';

import 'package:e_c/util/hex_color.dart';

class ProductModel {
  
  String name, descreption, price, image ,sized,productID;
  Color color;
  ProductModel(this.name, this.descreption, this.price, this.image, this.color, sized,this.productID);
  
  ProductModel.fromJson(Map<dynamic, dynamic> map){
    if(map == null) return;
    name = map['name'];
    descreption = map['descreption'];
    price = map['price'];
    image = map['image'];
    color = HexColor.fromHex(map['color']) ;
    sized = map['sized'];
    productID = map['productID'];
  }

  toJson(){
    return {
      'name' : name,
      'descreption' : descreption,
      'price' : price,
      'image' : image,
      'color' : color,
      'sized' : sized,
      'productID' : productID
    };
  }
}