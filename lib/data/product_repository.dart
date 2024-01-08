import 'package:trendyol_store/data/product_api_client.dart';
import 'package:trendyol_store/models/product.dart';
import '../locator.dart';
import '../models/cart.dart';
import 'cart_api_client.dart';

class ProductRepository {
  ProductApiClient productApiClient = locator<ProductApiClient>();
  CartApiClient cartApiClient = locator<CartApiClient>();
  Future<List<Product>> getProducts() async {
    List<Product> products = await productApiClient.getProductsClient();

    return products;
  }
  Future<Cart> getCart() async {
    Cart cart = await cartApiClient.getCartClient();

    return cart;
  }
}
