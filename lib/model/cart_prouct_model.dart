
class CartProductModel {
    
  String name, price, image,productID;
  int quantity;
  CartProductModel({this.name, this.quantity, this.price, this.image,this.productID});

   CartProductModel.fromJson(Map<dynamic, dynamic> map){
    if(map == null) return;
    name = map['name'];
    quantity = map['quantity'];
    price = map['price'];
    image = map['image'];
    productID = map['productID'];
  }

  toJson(){
    return {
      'name' : name,
      'quantity' : quantity,
      'price' : price,
      'image' : image,
      'productID' : productID
    };
  }
}

