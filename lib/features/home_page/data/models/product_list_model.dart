// To parse this JSON data, do
//
//     final productListModel = productListModelFromMap(jsonString);

//import 'dart:convert';

// ProductListModel productListModelFromMap(String str) => ProductListModel.fromMap(json.decode(str));

// String productListModelToMap(ProductListModel data) => json.encode(data.toMap());

class ProductListModel {
  List<Product> products;

  ProductListModel({
    required this.products,
  });

  factory ProductListModel.fromMap(Map<String, dynamic> json) =>
      ProductListModel(
        products:
            List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
      };
}

class Product {
  int pId;
  String sTitile;
  String lTitile;
  String discription;
  double rating;
  double price;
  List<String> images;
  List<OtherDetail> otherDetails;

  Product({
    required this.pId,
    required this.sTitile,
    required this.lTitile,
    required this.discription,
    required this.rating,
    required this.price,
    required this.images,
    required this.otherDetails,
  });

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        pId: json["pId"],
        sTitile: json["sTitile"],
        lTitile: json["lTitile"],
        discription: json["discription"],
        rating: json["rating"]?.toDouble(),
        price: json["price"]?.toDouble(),
        images: List<String>.from(json["images"].map((x) => x)),
        otherDetails: List<OtherDetail>.from(
            json["otherDetails"].map((x) => OtherDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "pId": pId,
        "sTitile": sTitile,
        "lTitile": lTitile,
        "discription": discription,
        "rating": rating,
        "price": price,
        "images": List<dynamic>.from(images.map((x) => x)),
        "otherDetails": List<dynamic>.from(otherDetails.map((x) => x.toMap())),
      };
}

class OtherDetail {
  String title;
  String value;

  OtherDetail({
    required this.title,
    required this.value,
  });

  factory OtherDetail.fromMap(Map<String, dynamic> json) => OtherDetail(
        title: json["title"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "value": value,
      };
}
