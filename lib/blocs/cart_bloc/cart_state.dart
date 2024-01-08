part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitialState extends CartState {}

final class CartLoadedState extends CartState {
  final List<Product> product;

  const CartLoadedState({required this.product});
  @override
  List<Object> get props => [product];
}
