import 'package:flutter/material.dart';
import 'package:get_x_shoping_demo/Views/shoping_cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoping getX Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShopingPage(),
    );
  }
}
