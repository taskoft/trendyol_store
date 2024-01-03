import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
          centerTitle: true,
          title: const Image(
            image: AssetImage("assets/icons/trendyol_logo_2.png"),
            fit: BoxFit.contain,
            height: 35,
            alignment: Alignment.center,
          ),
        );
  }
}