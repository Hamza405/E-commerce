import 'package:flutter/foundation.dart';

class CategoryModel {

  String image, name;
  CategoryModel(this.image,this.name);

  CategoryModel.fromJson(Map<dynamic,dynamic> map){
    if (map ==null) {
      debugPrint('no map');
      return;
    }
    image = map['image'];
    name = map['name'];
    

  }

  toJson(){
    return {
      'image' : image,
    'name' : name,
    
    };
  }


}