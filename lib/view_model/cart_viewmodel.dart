import 'package:e_c/model/cart_prouct_model.dart';
import 'package:e_c/serves/database/cart_database_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;

  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CartProductModel> _cartproductModel = [];
  List<CartProductModel> get cartProductModel => _cartproductModel;

  double _totalPrice = 0;
  double get totalPrice => _totalPrice;
   var dbHelper = CartDatabaseHelper.db;

  CartViewModel() {
    
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;
    _cartproductModel = await dbHelper.getallProduct();
    print(_cartproductModel.length);
    _loading.value = false;
    getTotalPrice();
    update();
  }
  getTotalPrice() {
    for (int i = 0; i < _cartproductModel.length; i++) {
      _totalPrice = 0;
      _totalPrice += (double.parse(_cartproductModel[i].price) *
          _cartproductModel[i].quantity);
    }
    print(_totalPrice);
    update();
  }

  addproduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartproductModel.length; i++) {
      if (_cartproductModel[i].productID == cartProductModel.productID) {
        return;
      }
    }
   
    await dbHelper.insert(cartProductModel);
    _cartproductModel.add(cartProductModel);
    _totalPrice += (double.parse(cartProductModel.price) *
          cartProductModel.quantity);
    Get.snackbar( "successfully",'Product has been added successfully');  

    update();
  }

  increasQuantity(int index) async{
    _cartproductModel[index].quantity++;
    _totalPrice += double.parse(_cartproductModel[index].price);
    await dbHelper.updateProduct(_cartproductModel[index]);
          update();
  }

  decreasQuantity(int index)async{
    _cartproductModel[index].quantity--;
    _totalPrice -= double.parse(_cartproductModel[index].price);
    await dbHelper.updateProduct(_cartproductModel[index]);
          update();
  }

  deleteProduct(CartProductModel model)async{
    _totalPrice -= (double.parse(model.price) *
          model.quantity);
    dbHelper.deleteProduct(model);
    // getAllProduct(); 
    // getTotalPrice();
    
    update();
    Get.snackbar('success', 'Product has been deleted from your cart');
  }

  
}
