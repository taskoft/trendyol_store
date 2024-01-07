// ignore_for_file: prefer_const_constructors_in_immutables, annotate_overrides, overridden_fields

part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  /*final List<Product> products;

  ProductListState({required this.products});
*/
  //List<Product> products=<Product>[] ;
}


class SearchInitialState extends SearchState {
  // ProductListInitialState({required super.products});

  @override
  List<Object?> get props => [];
}

class SearchLoadedState extends SearchState {
  final List<Product> sProducts;

  SearchLoadedState({required this.sProducts});

  // ProductListLoadedState({required this.products}) : super(products: products);

  @override
  List<Object?> get props => [sProducts];
}


