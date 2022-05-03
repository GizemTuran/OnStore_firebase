import 'package:flutter/material.dart';

class Products {
  List<Categories>? categories;

  Products({this.categories});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? name;
  List<Product>? product;

  Categories({this.name, this.product});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  List<String>? colors;
  String? description;
  int? id;
  List<String>? images;
  bool? isFavourite;
  bool? isPopular;
  double? price;
  double? rating;
  String? title;

  Product(
      {required this.colors,
      required this.description,
      required this.id,
      required this.images,
      this.isFavourite,
      this.isPopular,
      required this.price,
      required this.rating,
      required this.title});

  Product.fromJson(Map<String, dynamic> json) {
    colors = json['colors'].cast<String>();
    description = json['description'];
    id = json['id'];
    images = json['images'].cast<String>();
    isFavourite = json['isFavourite'];
    isPopular = json['isPopular'];
    price = json['price'];
    rating = json['rating'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['colors'] = this.colors;
    data['description'] = this.description;
    data['id'] = this.id;
    data['images'] = this.images;
    data['isFavourite'] = this.isFavourite;
    data['isPopular'] = this.isPopular;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['title'] = this.title;
    return data;
  }
}

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      "Color(0xFFF6625E)",
      "Color(0xFF836DB8)",
      "Color(0xFFDECB9C)",
      "Colors.white",
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    colors: [
      "Color(0xFFF6625E)",
      "Color(0xFF836DB8)",
      "Color(0xFFDECB9C)",
      "Colors.white",
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      " Color(0xFFF6625E)",
      " Color(0xFF836DB8)",
      " Color(0xFFDECB9C)",
      " Colors.white",
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      "Color(0xFFF6625E)",
      "Color(0xFF836DB8)",
      "Color(0xFFDECB9C)",
      "Colors.white",
    ],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
