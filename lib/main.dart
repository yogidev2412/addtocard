import 'package:addtocart/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController pc = Get.put(ProductController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
