import 'package:equatable/equatable.dart';
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
   // on<ChangeStatetaEvent>(_changeState);
    on<SearchProductsEvent>(_searchProducts);
  }

  void _fetchProducts(
      FetchProductsEvent event, Emitter<ProductListState> emit) async {
    final List<Product> products = await productRepository.getProducts();

    emit(ProductListLoadedState(products: products));
  }

  void _searchProducts(
      SearchProductsEvent event, Emitter<ProductListState> emit) async {
    final List<Product> products = await productRepository.getProducts();
    List<Product> searchedProducts = [];
    for (var element in products) {
      if (element.title!.contains(event.word)) {
        searchedProducts.add(element);
      }
    }
    emit(ProductListLoadedState(products: searchedProducts));
  }

  /*void _changeState(ChangeStatetaEvent event, Emitter<ProductListState> emit) {
    emit(ProductListLoadedState(products: products));
  }*/
}
