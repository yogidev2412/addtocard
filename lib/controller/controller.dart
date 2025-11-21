import 'dart:convert';

import 'package:addtocart/model/data_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  // get save server data
  RxList serverData = <DataModel>[].obs;

  // add to card list
  RxList addToCardProducts = <DataModel>[].obs;

  //Liked Button
  RxList likedButton = <DataModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    serverData.value = await getData();
  }

  // get data from server
  Future<List<DataModel>> getData() async {
    var res = await http.get(Uri.parse("https://fakestoreapi.com/products"));

    List<dynamic> data = jsonDecode(res.body);

    if (res.statusCode == 200) {
      return data.map((item) => DataModel.fromJson(item)).toList();
    } else {
      throw Exception("Error ouccred");
    }
  }

  // add to cart
  void addToCard(index) {
    addToCardProducts.add(serverData[index]);
  }

  // remove to card
  void removeToCard(index) {
    addToCardProducts.removeAt(index);
  }

  //liked products
  void likedProducts(index) {
    serverData[index].isLiked = !serverData[index].isLiked;
    if (serverData[index].isLiked) {
      likedButton.add(serverData[index]);
      serverData.refresh();
    } else {
      likedButton.removeAt(index);
      serverData.refresh();
    }
  }

  //remove to liked product
  void removeToLikedProduct(index) {
    likedButton.removeAt(index);
    likedButton.refresh();
  }
}
