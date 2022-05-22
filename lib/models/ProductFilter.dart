import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:onstore/models/Product.dart';

class ProductFilterProvider extends ChangeNotifier {
  List<Product> _products = [];

  String category = "";
  String scategory = "";
  static List<String> _categories = ['fashion', 'electronics'];
  static List<Map<String, dynamic>> _subCategories = [
    {
      "children": [
        {
          "child": "men",
          "children": ["shirts", "pants", "shoes"]
        },
        {
          "child": "women",
          "children": ["shirts", "pants", "shoes", "bags", "skirts"]
        },
        {
          "child": "unisex",
          "children": ["accessories"]
        }
      ]
    },
    {
      "children": ["consoles", "tvs", "phones", "misc"]
    },
  ];

  List<String> filter = [];
  List<String> cat1 = [];
  List<dynamic> cat2 = [];
  List<Product> get products => _products;
  List<String> getCategories() {
    if (category == "") {
      filter.clear();
      cat1.clear();
      cat2.clear();
      cat1.addAll(_categories);
      cat2.addAll(_subCategories);
      print(cat2);
    }
    return cat1;
  }

  List<String> getSubCategories(String cat) {
    int idx = cat1.indexWhere((element) => element == cat);
    List<String> scat = [];

    if (idx > -1 &&
        cat2.length > 0 &&
        cat2.elementAt(idx) is Map &&
        cat2.elementAt(idx)['children'] is List)
      cat2.elementAt(idx)['children'].forEach((el) {
        el is Map ? scat.add(el['child']) : scat.add(el);
      });
    else {
      //if (idx > -1) print(cat2.elementAt(idx));
      print(cat2);
    }
    return scat;
  }

  void setCategory(String categorystr) {
    filter.add(categorystr);
    List<String> scats = [];
    int idx1 = -1;
    if (cat1.contains(categorystr)) {
      category = categorystr;
      idx1 = cat1.indexWhere((element) => element == categorystr);
      if (idx1 > -1) {
        scats = getSubCategories(categorystr);
        List<dynamic> temp = [];
        temp.addAll(cat2);
        cat2.clear();
        scats != []
            ? temp.elementAt(idx1) is Map
                ? cat2.addAll(temp.elementAt(idx1)['children'])
                : cat2.addAll(temp)
            : cat2.clear();
      }

      cat1.clear();
      cat1.addAll(scats);
    } else {
      scats = getSubCategories(category);
      idx1 = cat1.indexWhere((element) => element == category);
      int idx2 = scats.indexWhere((element) => element == categorystr);
      if (idx1 > -1 && idx2 > -1) {
        cat1.clear();
        cat1.addAll(scats);
        List catt = [];
        catt.addAll(cat2);

        cat2 = cat2 is List ? cat2.elementAt(idx2)["children"] : [];
      } else if (idx1 > -1) {
        print("else if ");
      } else {}
    }
    notifyListeners();
  }

  void filterCategories() {
    /*  if (category == "") {
      cat1 = categories.keys.toList();
      if (categories[cat1[0]] is Map) {
        final c = categories.entries.toList();
        print(c);
      }
    } else {
      print(categories[cat1[0]]);
    }*/
  }

  Future<void> filterProducts() async {
    filterCategories();

    /*if (scategory == "") {
      final cat1 = await FirebaseService.getSubcategories("");
      categories = cat1;
    } else {
      final cat1 = await FirebaseService.getSubcategories(category);
      categories = cat1;
    }*/
    //notifyListeners();
  }
}
