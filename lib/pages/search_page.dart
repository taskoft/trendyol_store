import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendyol_store/blocs/search_bloc/search_bloc.dart';
import 'package:trendyol_store/pages/detail_page.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    debugPrint("SEARCH BUILD TETIKLENDI");
    final sBloc = BlocProvider.of<SearchBloc>(context);

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(30),
          alignment: Alignment.center,
          width: 350,
          child: TextField(
            onChanged: (value) {
              context.read<SearchBloc>().add(SearchProductsEvent(word: value));
            },
            decoration: const InputDecoration(hintText: 'Type here to search'),
          ),
        ),
        BlocBuilder<SearchBloc, SearchState>(
          bloc: sBloc,
          builder: (context, state) {
            if (state is SearchLoadedState) {
              debugPrint("state girdi--------------------");
              debugPrint(state.sProducts.toString());

              return Expanded(
                child: ListView.builder(
                    itemCount: state.sProducts.length,
                    itemBuilder: (context, index) {
                      final product = state.sProducts[index];
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
