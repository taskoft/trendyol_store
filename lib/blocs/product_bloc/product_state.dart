part of 'product_bloc.dart';

abstract class ProductListState extends Equatable {
 final List<Product> products;

  ProductListState({required this.products});

  //List<Product> products=<Product>[] ;
}

class ProductLoadingState extends ProductListState {
  ProductLoadingState({required super.products});

  
  @override
  List<Object?> get props => [];
}

class ProductListInitialState extends ProductListState {
  ProductListInitialState({required super.products});

  @override
  List<Object?> get props => [];
}

class ProductListLoadedState extends ProductListState {
 final List<Product> products;

  ProductListLoadedState({required this.products}) : super(products: products);

  @override
  List<Object?> get props => [products];
}
