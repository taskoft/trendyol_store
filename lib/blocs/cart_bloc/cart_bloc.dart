import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/product_repository.dart';
import '../../locator.dart';
import '../../models/cart.dart';
import '../../models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ProductRepository productRepository = locator<ProductRepository>();

  CartBloc() : super(CartInitialState()) {
    on<FetchCartEvent>(_fetchCart);
    on<AddCartEvent>(_addCart);
  }

  void _fetchCart(FetchCartEvent event, Emitter<CartState> emit) async {
    Cart cart = await productRepository.getCart();
    List<Product> allProducts = await productRepository.getProducts();
    List<Product> produtsInCart = [];

    for (var i = 0; i < cart.products!.length; i++) {
      produtsInCart.add(allProducts
          .firstWhere((element) => element.id == cart.products![i].productId));
    }

    emit(CartLoadedState(product: produtsInCart));
  }

  void _addCart(AddCartEvent event, Emitter<CartState> emit) async {
    /*carts= carts.firstWhere((element) {
      if(element.id==event.cart.id){return element}
      } )*/
    // emit(CartLoadedState(carts: ..event.cart));
  }
}
