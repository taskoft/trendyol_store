import 'package:trendyol_store/data/product_api_client.dart';
import 'package:trendyol_store/models/product.dart';
import '../locator.dart';

class ProductRepository {
  ProductApiClient productApiClient = locator<ProductApiClient>();
  Future<List<Product>> getProducts() async {
    List<Product> products =await productApiClient.getProductsClient();
    
    return products;
  }
}
