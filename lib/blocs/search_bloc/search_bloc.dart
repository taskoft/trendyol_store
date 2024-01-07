import 'package:equatable/equatable.dart';
import 'package:trendyol_store/data/product_repository.dart';
import 'package:trendyol_store/locator.dart';
import '../../models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';
part 'search_event.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ProductRepository productRepository = locator<ProductRepository>();

  SearchBloc(super.initialState) {
    on<FetchSEvent>(_fetchSProducts);
   // on<ChangeStatetaEvent>(_changeState);
    on<SearchProductsEvent>(_searchProducts);
  }
  List<Product> products=[];
  void _fetchSProducts(
      FetchSEvent event, Emitter<SearchState> emit) async {
    products = await productRepository.getProducts();

    emit(SearchLoadedState(sProducts: products));
  }

  void _searchProducts(
      SearchProductsEvent event, Emitter<SearchState> emit) async {
    products = await productRepository.getProducts();
    List<Product> searchedProducts = [];
    for (var element in products) {
      if (element.title!.contains(event.word)) {
        searchedProducts.add(element);
      }
    }
    emit(SearchLoadedState(sProducts: searchedProducts));
  }

 /* void _changeState(ChangeStatetaEvent event, Emitter<ProductListState> emit) {
    emit(ProductListLoadedState(products: products));
  }*/
}
