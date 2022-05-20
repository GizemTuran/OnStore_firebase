import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onstore/models/Product.dart';

Future<Image> getImage(BuildContext context, String imageName) async {
  Image? image;
  await FireStorageService.loadImage(context, imageName).then((value) {
    image = Image.network(value.toString(), fit: BoxFit.scaleDown);
  });
  return image!;
}

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}

class FirebaseService {
  static Future<Map<String, int>> getCategories() async {
    Map<String, int> categories = {};
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('mainCategory').once().then((event) {
      event.snapshot.children.forEach((element) {
        categories.addAll({element.key.toString(): element.value as int});
      });
    });
    return categories;
  }

  static Future<List<String>> getSubCategories(
      String category, int depth) async {
    List<String> cat = [];
    final ref = FirebaseDatabase.instance.ref();
    await ref.child(category).once().then(
      (value) {
        if (depth > 1) {
          value.snapshot.children.forEach((element) async {
            int len = element.children.length;
            String key = element.key.toString();
            for (int i = 0; i < len; i++) {
              String l = i.toString();
              String a = element.child(l).value.toString();
              String k = "$key/$a";
              cat.add(k);
            }
          });
        } else {
          value.snapshot.children.forEach((element) {
            cat.add(element.value.toString());
          });
        }
      },
    );
    return cat;
  }

  static List<String> cate = [];
  static Future<List<Product>> getProducts() async {
    List<Product> products = [];
    List<String> productpaths = [];
    List<String> subcat = [];
    final categories = await getCategories();
    var response;
    categories.forEach((key, value) async {
      response = await getSubCategories(key, value)
          .then((value) {
            subcat.addAll(value);
          })
          .then((value) => productpaths = subcat)
          .then((value) => cate = value);
    });
    for (String c in cate) {
      products.addAll(await getProductbyCat(c));
    }

    return products;
  }

  static Future<List<Product>> getProductbyCat(String cat) async {
    List<Product> products = [];
    final ref = FirebaseDatabase.instance.ref("products");
    final response = await ref.child(cat).get();
    for (final child in response.children) {
      final pro = Product.fromJson(toMapProduct(child));
      if (kDebugMode) {
        print(pro.title);
      }
      products.add(pro);
    }

    return products;
  }

  static Future<List<Product>> getPopProducts() async {
    List<Product> popularproducts = [];
    final ref = FirebaseDatabase.instance.ref();
    final response = await ref.child("popular_products/data").get();
    for (final child in response.children) {
      final pro = Product.fromJson(toMapProduct(child));
      popularproducts.add(pro);
    }
    return popularproducts;
  }

  static Map<String, dynamic> toMapCategory(item) {
    print("pr:  ${item.value.entries}\n");
    return {"category": item.value};
  }

  static Map<String, dynamic> toMapProduct(item) {
    return {
      "title": item.child("title").value,
      "images": item.child("images").value,
      "price": item.child("price").value,
      "rating": item.child("rating").value,
      "description": item.child("description").value,
      "category": item.child("category").value,
      "id": item.child("id").value,
      "colors": item.child("colors").value,
      "isFavourite": item.child("isFavourite").value ?? false,
      "isPopular": item.child("isPopular").value ?? false
    };
  }
}
