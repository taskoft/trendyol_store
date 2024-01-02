part of 'product_bloc.dart';


abstract class ProductListState {
  //List<Product> products=<Product>[] ;
}
class ProductLoadingState extends ProductListState{
}
class ProductListInitialState extends ProductListState{
}
class ProductListLoadedState extends ProductListState{
   List<Product> products=[] ;
   
  ProductListLoadedState({required this.products});
  
  
}