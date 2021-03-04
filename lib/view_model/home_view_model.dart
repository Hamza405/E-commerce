import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_c/model/category_model.dart';
import 'package:e_c/model/product.dart';
import 'package:flutter/foundation.dart';
import 'package:get/state_manager.dart';

class HomeViewModel extends GetxController{

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading; 
  final CollectionReference _categoryCollectionRef = FirebaseFirestore.instance.collection(' category');
  final CollectionReference _productCollectionRef = FirebaseFirestore.instance.collection('products');

  List<CategoryModel> _categoryModel = [];
  List<ProductModel> _productModel = [];
  
  List<CategoryModel> get categoryModel => _categoryModel;
  List<ProductModel> get productModel => _productModel;

  HomeViewModel() {

    
    getc();
    getProduct();
   
  }
  
  getc() async {
    _loading.value = true;
    
    await  _categoryCollectionRef.get().then((value) {
      for(int i=0; i<value.docs.length;i++){
        _categoryModel.add(CategoryModel.fromJson(value.docs[i].data()));
      }
    });
    _loading.value = false;
    update();
  }
  
  getProduct()async{
    
    _loading.value=true;
    await _productCollectionRef.get().then((value) {
      for(int i =0; i<value.docs.length;i++){
        _productModel.add(ProductModel.fromJson(value.docs[i].data()));

      }
    });
    _loading.value = false;
    update();
  }

  

}