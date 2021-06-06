import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get_x_shoping_demo/Models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
  int get totalItems => cartItems.length;

  addToCart(Product product) {
    this.cartItems.add(product);
  }
}
