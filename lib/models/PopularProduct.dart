import 'package:flutter/material.dart';
import 'package:onstore/models/Product.dart';

class PopularProductsModel {
  PopularProducts? products;

  PopularProductsModel({this.products});

  PopularProductsModel.fromJson(Map<String, dynamic> json) {
    products = json['products'] != null
        ? new PopularProducts.fromJson(json['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    return data;
  }
}

class PopularProducts {
  List<Product>? data;

  PopularProducts({this.data});

  PopularProducts.fromJson(Map<String, dynamic> json) {
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
