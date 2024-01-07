import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  final String productImagePath;
  final String productName;
  final void Function(int, bool) addFavoriteId;
  final void Function(int) detailFunction;
  final int productId;
  final bool productIsChecked;
  const CardWidget(
      {super.key,
      required this.productImagePath,
      required this.productName,
      required this.productId,
      required this.productIsChecked,
      required this.addFavoriteId,
      required this.detailFunction});
  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  late bool isChecked;
  late final String productImagePath;
  late final String productName;
  late final int productId;

  @override
  void initState() {
    super.initState();
    isChecked = widget.productIsChecked;
    productImagePath = widget.productImagePath;
    productName = widget.productName;
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
                  height: 130,
                  alignment: Alignment.center,
                  fit: BoxFit.contain),
            ),
          ),
          Positioned(
              left: 10,
              right: 10,
              top: 150,
              child: TextButton(
                onPressed: () {
                  widget.detailFunction(productId);
                },
                child: Text(
                  productName,
                  style: const TextStyle(color: Colors.black  ,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      fontFamily: 'Dance'),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              )),
          const Positioned(
            left: 20,
            right: 20,
            top: 186,
            child: Text(
              'SHOP NOW  ',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
          const Positioned(
              left: 40,
              right: 40,
              top: 206,
              child: Divider(
                color: Colors.black,
                height: 4,
                thickness: 2,
              )),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              icon: Icon(
                (isChecked ? Icons.favorite : Icons.favorite_outline),
                color: (isChecked ? Colors.red : Colors.black),
              ),
              onPressed: () {
               // debugPrint("ONPRESSED");
                isChecked = !isChecked;
                //debugPrint(isChecked.toString());
                widget.addFavoriteId(productId, isChecked);
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
