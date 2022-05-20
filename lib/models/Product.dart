import 'package:firebase_database/firebase_database.dart';

class Category {
  late String name;
  List<FirstSubCategory>? firstSubCategories;

  Category({required this.name, this.firstSubCategories});

  Category.fromJson({required String name, required DataSnapshot json}) {
    Category category;
    if (json != null) {
      List<FirstSubCategory> firstSubCategories = [];
      name = name;
      for (var i in json.children) {
        i.children.forEach((element) {
          firstSubCategories.add(
              FirstSubCategory.fromJson(name: i.key.toString(), json: element));
        });
      }
    }
  }
}

class FirstSubCategory {
  late String name;
  List<SecondSubCategory>? subCategories;

  FirstSubCategory({required this.name, this.subCategories});
  FirstSubCategory.fromJson(
      {required String name, required DataSnapshot json}) {
    if (json.children != null) {
      print(json.children.iterator.moveNext().runtimeType);
    }
  }
}

class SecondSubCategory {
  late String name;
  List<Product>? products;

  SecondSubCategory({required this.name, this.products});

  SecondSubCategory.fromJson(String name, Map<String, dynamic> json) {
    print(json.keys);
  }
}

class Products {
  List<Product>? data;

  Products({this.data});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
      {this.colors,
      this.description,
      this.id,
      this.images,
      this.isFavourite,
      this.isPopular,
      this.price,
      this.rating,
      this.title});

  Product.fromJson(Map<String, dynamic> json) {
    colors = json['colors'].cast<String>();
    description = json['description'];
    id = json['id'];
    images = json['images'].cast<String>();
    isFavourite = json['isFavourite'];
    isPopular = json['isPopular'];
    price = json['price'].toDouble();
    rating = json['rating'].toDouble();
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
