import 'package:trendyol_store/data/product_repository.dart';
import 'package:trendyol_store/locator.dart';

import '../../models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'product_state.dart';
part 'product_event.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductRepository productRepository = locator<ProductRepository>();

  ProductListBloc(super.initialState) {
    on<FetchProductsEvent>(_fetchProducts);
  }

  void _fetchProducts (
      FetchProductsEvent event, Emitter<ProductListState> emit) async{
         
        final List<Product> products =await productRepository.getProducts();
       debugPrint("A");
    emit(ProductListLoadedState(products: products));
  }
}
