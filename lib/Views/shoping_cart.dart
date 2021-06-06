import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get_x_shoping_demo/Controllers/cart_controller.dart';
import 'package:get_x_shoping_demo/Controllers/shoping_controller.dart';

class ShopingPage extends StatelessWidget {
  final shopingController = Get.put(ShopingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: Column(
        children: [
          Expanded(
            child: GetX<ShopingController>(builder: (controller) {
              return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.amber,
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.products[index].productName}',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                        '${controller.products[index].productDescription}'),
                                  ],
                                ),
                                Text('\$${controller.products[index].price}',
                                    style: TextStyle(fontSize: 24)),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                cartController
                                    .addToCart(controller.products[index]);
                              },
                              child: Text('Add to Cart'),
                            ),
                            Obx(() => IconButton(
                                  icon: controller
                                          .products[index].isFavorite.value
                                      ? Icon(Icons.check_box_rounded)
                                      : Icon(Icons
                                          .check_box_outline_blank_outlined),
                                  onPressed: () {
                                    controller.products[index].isFavorite
                                        .toggle();
                                  },
                                ))
                          ],
                        ),
                      ),
                    );
                  });
            }),
          ),
          Obx(() {
            return Text(
              "Total Amount : \$ ${cartController.totalPrice}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            );
          }),
          SizedBox(
            height: 100,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.amber,
          onPressed: () {},
          icon: Icon(
            Icons.add_shopping_cart_rounded,
            color: Colors.black,
          ),
          label: GetX<CartController>(builder: (controller) {
            return Text(
              controller.totalItems.toString(),
              style: TextStyle(fontSize: 20, color: Colors.black),
            );
          })),
    );
  }
}
