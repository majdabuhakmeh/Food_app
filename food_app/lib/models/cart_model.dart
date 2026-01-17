import 'package:food_app/models/products_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int quantity=0;
  bool isExist=false;
  String? time;
  ProductModel? product;

  CartModel(
      {this.id,
      this.name,
      this.price,
      this.img,
      this.quantity=0,
      this.isExist=false,   
      this.time,
      this.product,
    });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    isExist = json['isExist'];  
    time = json['time'];
    product = ProductModel.fromJson(json['product']);
 
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['img'] = img;
    data['quantity'] = quantity;
    data['isExist'] = isExist;  
    data['time'] = time;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }

}