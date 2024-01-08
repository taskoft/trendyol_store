part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class FetchCartEvent extends CartEvent {
  // final List<Product> product=[Product()];
}

class AddCartEvent extends CartEvent {
  final Cart cart;

  const AddCartEvent({required this.cart});

  @override
  List<Object> get props => [cart];
}

class DeleteCartEvent extends CartEvent {
  final Cart cart;

  const DeleteCartEvent({required this.cart});

  @override
  List<Object> get props => [cart];
}
