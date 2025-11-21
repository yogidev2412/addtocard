class DataModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  bool isLiked;

  DataModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
    this.isLiked = false,
  });

  // fomr json
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      title: json["title"],
      price: json["price"] is double ? json["price"] : json["price"].toDouble(),
      description: json["description"],
      category: json["category"],
      image: json["image"],
      rating: Rating.fromJson(json["rating"]),
    );
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  //form json
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(rate: json['rate'], count: json['count']);
  }
}
