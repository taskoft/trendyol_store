import "dart:convert";
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/cart.dart';

class CartApiClient {
  static const baseUrlCart = "https://fakestoreapi.com/carts/1";
  final http.Client httpClient = http.Client();

  Future<Cart> getCartClient() async {
    try {
      final fetchedString = await httpClient.get(Uri.parse(baseUrlCart));
      if (fetchedString.statusCode != 200) {
        throw Exception("There is no data");
      } else {
        debugPrint("veri geldi");
       // final fetchedJson = jsonDecode(fetchedString.body);

      /*  Cart cart =
            fetchedJson.map<Cart>((json) => Cart.fromJson(json));*/
       Cart cart =   Cart.fromJson(jsonDecode(fetchedString.body)) ;
        return cart;
      }
    } catch (e) {
      debugPrint("hata");

      throw Exception(e.toString());
    }
  }
}
