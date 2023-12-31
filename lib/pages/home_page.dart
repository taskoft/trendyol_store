import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          centerTitle: true,
          title: const Image(
            image: AssetImage("assets/icons/trendyol_logo_2.png"),
            fit: BoxFit.contain,
            height: 55,
            alignment: Alignment.center,
          ),
        ),
      ),
      body: Expanded(
        child: GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 270, mainAxisExtent: 250),
            itemBuilder: (BuildContext context, int count) {
              return Container(
                color: Colors.blueGrey.shade50,
                margin: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    const Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      child: Icon(
                        Icons.adjust,
                        size: 160,
                      ),
                    ),
                    const Positioned(
                      left: 10,
                      right: 10,
                      top: 160,
                      child: Text(
                        'Artsy',
                        style: TextStyle(
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
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    /* Positioned(
                      left: 40,
                      top: 180,
                      child: Divider(color: Colors.black,)
                    ),*/
                    Positioned(
                        right: 0,
                        top: 0,
                        child: IconButton(
                          icon: const Icon(
                            Icons.favorite_border,
                            fill: 1,
                            color: Colors.black54,
                          ),
                          onPressed: () {},
                        )),
                  ],
                ),
              );
            }),
      ),

    );
  }
}

/* Container(
                margin: const EdgeInsets.all(10),
                color: Colors.black26,
                child: Row(children: [
                  const Column(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.badge,
                          size: 140,
                          color: Colors.white,
                        ),
                        Text(
                          'Product_Name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'SHOP NOW  ',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                        Divider(
                          color: Colors.black54,
                          indent: 40,
                        ),
                        Text('A')
                      ]),
                  Container(width: 20,
                    // margin: EdgeInsets.all(2),
                    alignment: Alignment.topCenter,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        fill: 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
              );*/