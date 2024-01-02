
import "dart:convert";

import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductApiClient {
  static const baseUrl = "https://fakestoreapi.com/products";
  final http.Client httpClient = http.Client();
  Future<List<Product>> getProductsClient() async {
    final fetchedString = await httpClient.get(Uri.parse(baseUrl));
    if (fetchedString.statusCode != 200) {
      throw Exception("There is no data");
    } else {
      final fetchedJson = jsonDecode(fetchedString.body);
       var fetchedProduct= fetchedJson.fromJson();
      return fetchedProduct;
    }
  }
}
