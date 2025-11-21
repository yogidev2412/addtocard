import 'package:addtocart/screens/add_to_card.dart';
import 'package:addtocart/screens/liked_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController pc = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 8, 189),
        title: Text(
          "Add To Cart",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          //liked button
          IconButton(
            onPressed: () {
              Get.to(AddToCard());
            },
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
          ),

          //add to cart
          IconButton(
            onPressed: () {
              Get.to(LikedProduct());
            },
            icon: Icon(Icons.favorite_outline, color: Colors.white),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Obx(
            () => ListView.builder(
              itemCount: pc.serverData.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(),
                        child: ListTile(
                          leading: Image.network(
                            "${pc.serverData[index].image}",
                            fit: BoxFit.cover,
                          ),

                          //title
                          title: Text(
                            "${pc.serverData[index].title}",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          //add to card button
                          trailing: TextButton(
                            onPressed: () {
                              pc.addToCard(index);
                            },
                            child: Text(
                              "Add",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    //likedbutton
                    Positioned(
                      right: 0,
                      child: Obx(
                        () => IconButton(
                          onPressed: () {
                            pc.likedProducts(index);
                            print(pc.likedButton);
                          },
                          icon: pc.serverData[index].isLiked
                              ? Icon(Icons.favorite, color: Colors.red)
                              : Icon(Icons.favorite_outline, color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
