import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';

class LikedProduct extends StatelessWidget {
  const LikedProduct({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController pc = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 32, 8, 189),
        title: Text(
          "Your Liked Products",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Obx(
            () => pc.likedButton.isEmpty
                ? Center(
                    child: Text(
                      "No Liked Products",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: pc.likedButton.length,
                    itemBuilder: (context, index) {
                      return Card(
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
                              "${pc.likedButton[index].image}",
                              fit: BoxFit.cover,
                            ),

                            //title
                            title: Text(
                              "${pc.likedButton[index].title}",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            //add to card button
                            trailing: IconButton(
                              onPressed: () {
                                pc.removeToLikedProduct(index);
                              },
                              icon: Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
