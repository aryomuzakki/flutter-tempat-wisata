import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Container(
              child: Image.network(
                "https://source.unsplash.com/random/1280x720/?nature",
                // fit: BoxFit.contain
              ),
            ),
            SafeArea(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Padding(
                        padding: EdgeInsets.all(0),
                        child: IconButton(
                          iconSize: 26,
                          icon: Icon(
                            _isFavorite
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: _isFavorite ? Colors.red : Colors.white,
                            shadows: !_isFavorite
                                ? []
                                : [
                                    Shadow(
                                      color: Colors.white,
                                      blurRadius: 10,
                                      offset: Offset(0, 2),
                                    )
                                  ],
                            // fill: _isFavorite ? 1 : 0,
                            // size: 26,
                          ),
                          onPressed: () {
                            setState(() {
                              _isFavorite = !_isFavorite;
                            });
                          },
                        ))
                  ],
                ),
              ),
            )
          ]),
          const Padding(
              padding: EdgeInsets.all(14),
              child: Column(
                children: [
                  // heading
                  Text(
                    "Title Here",
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // information
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.date_range_outlined),
                          SizedBox(height: 6),
                          Text("Open Everyday"),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.watch_later_outlined),
                          SizedBox(height: 6),
                          Text("09.00 - 20.00"),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.attach_money_outlined),
                          SizedBox(height: 6),
                          Text("Rp 25.000"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  // description
                  Text(
                    "Aliquip duis voluptate incididunt esse est anim aliquip. Cillum ut do aliqua aliquip minim ex Lorem adipisicing qui excepteur excepteur ex qui. Amet dolor dolore ut consequat magna cupidatat ut tempor. Excepteur est eu occaecat consectetur nulla. Incididunt voluptate magna aliqua sit mollit.",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  // Container(
                  //   height: 150,
                  //   child: ListView.builder(itemBuilder: (context, index) {
                  //     return
                  //   },),
                  // )
                ],
              ))
        ],
      ),
    );
  }
}
