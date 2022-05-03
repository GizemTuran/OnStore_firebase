import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:onstore/models/Product.dart';

Future<Image?> getImage(BuildContext context, String imageName) async {
  Image? image;
  await FireStorageService.loadImage(context, imageName).then((value) {
    image = Image.network(value.toString(), fit: BoxFit.scaleDown);
  });
  return image;
}

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
  static Future getProducts() async {
    final ref = FirebaseDatabase.instance.ref();
    ref.child("products/categories").onValue.listen((event) {
      for (final child in event.snapshot.children) {
        print("data: ${child.children.first.value}");
      }
    }, onError: (error) {
      print(error);
    });
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