// ignore_for_file: camel_case_types, unnecessary_new, prefer_collection_literals

class Cart {
  int? id;
  int? userId;
  String? date;
  List<ProductsA>? products;
  int? iV;

  Cart({this.id, this.userId, this.date, this.products, this.iV});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    date = json['date'];
    if (json['products'] != null) {
      products = <ProductsA>[];
      json['products'].forEach((v) {
        products!.add(new ProductsA.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['userId'] = userId;
    data['date'] = date;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    return data;
  }
}

class ProductsA {
  int? productId;
  int? quantity;

  ProductsA({this.productId, this.quantity});

  ProductsA.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = productId;
    data['quantity'] = quantity;
    return data;
  }
}