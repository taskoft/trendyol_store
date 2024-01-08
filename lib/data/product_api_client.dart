import "dart:convert";
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductApiClient {
  static const _baseUrlProducts = "https://fakestoreapi.com/products";
  final http.Client _httpClient = http.Client();
  Future<List<Product>> getProductsClient() async {
    try {
      final fetchedString = await _httpClient.get(Uri.parse(_baseUrlProducts));
      if (fetchedString.statusCode != 200) {
        throw Exception("There is no data");
      } else {
        final fetchedJson = jsonDecode(fetchedString.body);
       
        List<Product> products =
            fetchedJson.map<Product>((json) => Product.fromJson(json)).toList();
        return products;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
