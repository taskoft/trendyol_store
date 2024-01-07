part of 'search_bloc.dart';

@immutable
class SearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchSEvent extends SearchEvent {
  // final List<Product> product=[Product()];
}

/*class ChangeStatetaEvent extends ProductListEvent {
 // final List<Product> product=[Product()];
}*/

class SearchProductsEvent extends SearchEvent {
  final String word;

  SearchProductsEvent({required this.word});
  @override
  List<Object?> get props => [];
}
