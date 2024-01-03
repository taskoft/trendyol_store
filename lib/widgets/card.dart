import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  final String productImagePath;
  final String productName;
  // final List<int> favoriteIdList;
  final int productId;
  const CardWidget(
      {super.key,
      required this.productImagePath,
      required this.productName,
      required this.productId});
  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool isChecked = false;
  late final String productImagePath;
  late final String productName;
  late final int productId;
  List<int> favoriteIdList = [];

  @override
  void initState() {
    super.initState();
    productImagePath = widget.productImagePath;
    productName = widget.productName;
    //favoriteIdList.add(widget.productId) ;
    productId = widget.productId;
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      //color: Colors.white,
      margin: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Image.network(productImagePath,
                  height: 150,
                  alignment: Alignment.center,
                  fit: BoxFit.contain),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            top: 160,
            child: Text(
              productName,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  fontFamily: 'Dance'),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
          const Positioned(
            left: 20,
            right: 20,
            top: 200,
            child: Text(
              'SHOP NOW  ',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
          const Positioned(
              left: 40,
              right: 40,
              top: 219,
              child: Divider(
                color: Colors.black,
                height: 1,
                thickness: 2,
              )),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              icon: Icon(
                (isChecked ? Icons.favorite : Icons.favorite_outline),
                color: (isChecked ? Colors.red.shade300 : Colors.black45),
              ),
              onPressed: () {
                isChecked = !isChecked;
                if (isChecked) {
                  favoriteIdList.add(productId);
                  
                }
                setState(
                  () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
