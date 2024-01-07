import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendyol_store/pages/detail_page.dart';
import '../blocs/product_bloc/product_bloc.dart';
import '../models/product.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductListBloc>(context);

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(30),
          alignment: Alignment.center,
          width: 350,
          child: TextField(
            onChanged: (value) {
              context
                  .read<ProductListBloc>()
                  .add(SearchProductsEvent(word: value));
            },
            decoration: const InputDecoration(hintText: 'Type here to search'),
          ),
        ),
        BlocBuilder<ProductListBloc, ProductListState>(
          bloc: productBloc,
          builder: (context, state) {
            if (state is ProductListLoadedState) {
              return Expanded(
                child: ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return ListTile(
                        title: Text(
                          product.title!,
                          style: const TextStyle(
                            fontFamily: 'Dance',
                            fontSize: 30,
                          ),
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(product: product)),
                        ),
                      );
                    }),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
      ],
    );
  }
}
