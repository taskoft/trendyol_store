part of 'product_bloc.dart';


@immutable
class ProductListEvent extends Equatable{
  @override
  List<Object?> get props => [];

}

class FetchProductsEvent extends ProductListEvent {
 // final List<Product> product=[Product()];
}

class EditProductsEvent extends ProductListEvent {
 // final List<Product> product=[Product()];
}