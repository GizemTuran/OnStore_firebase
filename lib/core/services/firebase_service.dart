import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:onstore/constants.dart';
import 'package:onstore/models/Product.dart';

Future<Image> getImage(BuildContext context, String imageName) async {
  Image? image;
  await FireStorageService.loadImage(context, imageName).then((value) {
    image = Image.network(value.toString(), fit: BoxFit.scaleDown);
  });
  return image!;
}

/*class FireStoreImage extends StatelessWidget {
  FireStoreImage({Key? key, required this.Url}) : super(key: key);
  String Url;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
      future: getImage(context, "test/minions.jpg"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20)),
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.width / 2,
            child: snapshot.,
          );
        }
        if (snapshot.connectionState == ConnectionState.active) {
          return Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.width / 1.2,
            child: CircularProgressIndicator(
              color: kSecondaryColor.withOpacity(1),
            ),
          );
        }
        return Container();
      },
    ));
  }
}*/

/*Future<Widget>_getImage(BuildContext context, String imageName) async{
  Image image;
  await FireStorageService.loadImage(context, imageName).then((value){
  image = Image.network(
    value.toString(),
    fit: BoxFit.scaleDown,
  );
  });
  return image;
}*/

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}

class FirebaseService {
  static Future<List<Product>> getProducts() async {
    List<Product> products = [];
    final ref = FirebaseDatabase.instance.ref();
    final response = await ref.child("products/data").get();
    for (final child in response.children) {
      final pro = Product.fromJson(toMap(child));
      products.add(pro);
    }

    return products;
  }

  static Map<String, dynamic> toMap(item) {
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
/*
List<Products> _parseData(DataSnapshot dataSnapshot) {
    var  products= <Products>[];
    var mapOfMaps = Map<String, dynamic>.from(<String,dynamic>(dataSnapshot.value));

    mapOfMaps.values.forEach((value) {
      companyList.add(Poll.fromJson(Map.from(value)));
    });
    return companyList;
  }*/