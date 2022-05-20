/*class productList {
  Products? products;

  productList({this.products});

  productList.fromJson(Map<String, dynamic> json) {
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
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

class Products {
  Electronics? electronics;
  Fashion? fashion;

  Products({this.electronics, this.fashion});

  Products.fromJson(Map<String, dynamic> json) {
    electronics = json['electronics'] != null
        ? new Electronics.fromJson(json['electronics'])
        : null;
    fashion =
        json['fashion'] != null ? new Fashion.fromJson(json['fashion']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.electronics != null) {
      data['electronics'] = this.electronics!.toJson();
    }
    if (this.fashion != null) {
      data['fashion'] = this.fashion!.toJson();
    }
    return data;
  }
}

class Electronics {
  List<Consoles>? consoles;
  List<Misc>? misc;

  Electronics({this.consoles, this.misc});

  Electronics.fromJson(Map<String, dynamic> json) {
    if (json['consoles'] != null) {
      consoles = <Consoles>[];
      json['consoles'].forEach((v) {
        consoles!.add(new Consoles.fromJson(v));
      });
    }
    if (json['misc'] != null) {
      misc = <Misc>[];
      json['misc'].forEach((v) {
        misc!.add(new Misc.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.consoles != null) {
      data['consoles'] = this.consoles!.map((v) => v.toJson()).toList();
    }
    if (this.misc != null) {
      data['misc'] = this.misc!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Consoles {
  List<String>? colors;
  String? description;
  int? id;
  List<String>? images;
  bool? isFavourite;
  bool? isPopular;
  double? price;
  double? rating;
  String? title;

  Consoles(
      {this.colors,
      this.description,
      this.id,
      this.images,
      this.isFavourite,
      this.isPopular,
      this.price,
      this.rating,
      this.title});

  Consoles.fromJson(Map<String, dynamic> json) {
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

class Fashion {
  Men? men;
  Unisex? unisex;

  Fashion({this.men, this.unisex});

  Fashion.fromJson(Map<String, dynamic> json) {
    men = json['men'] != null ? new Men.fromJson(json['men']) : null;
    unisex =
        json['unisex'] != null ? new Unisex.fromJson(json['unisex']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.men != null) {
      data['men'] = this.men!.toJson();
    }
    if (this.unisex != null) {
      data['unisex'] = this.unisex!.toJson();
    }
    return data;
  }
}

class Men {
  List<Pants>? pants;

  Men({this.pants});

  Men.fromJson(Map<String, dynamic> json) {
    if (json['pants'] != null) {
      pants = <Pants>[];
      json['pants'].forEach((v) {
        pants!.add(new Pants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pants != null) {
      data['pants'] = this.pants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Unisex {
  List<Accessories>? accessories;

  Unisex({this.accessories});

  Unisex.fromJson(Map<String, dynamic> json) {
    if (json['accessories'] != null) {
      accessories = <Accessories>[];
      json['accessories'].forEach((v) {
        accessories!.add(new Accessories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.accessories != null) {
      data['accessories'] = this.accessories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}*/