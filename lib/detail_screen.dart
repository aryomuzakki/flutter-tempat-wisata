import 'dart:ui';

import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;

  bool isLarge = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > constraints.maxHeight &&
              constraints.maxWidth > 600) {
            // landscape or desktop view
            isLarge = true;
          } else if (constraints.maxWidth > 680) {
            isLarge = true;
          } else {
            isLarge = false;
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                // image and buttons
                isLarge
                    ? Container()
                    : Stack(
                        children: <Widget>[
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  InkWell(
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
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
                                    padding: const EdgeInsets.all(0),
                                    child: IconButton(
                                      iconSize: 26,
                                      icon: Icon(
                                        isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_outline,
                                        color: isFavorite
                                            ? Colors.red
                                            : Colors.white,
                                        shadows: !isFavorite
                                            ? [
                                                const Shadow(
                                                  color: Colors.black,
                                                  blurRadius: 10,
                                                  offset: Offset(0, 2),
                                                )
                                              ]
                                            : [
                                                const Shadow(
                                                  color: Colors.white,
                                                  blurRadius: 10,
                                                  offset: Offset(0, 2),
                                                )
                                              ],
                                        // fill: isFavorite ? 1 : 0,
                                        // size: 26,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isFavorite = !isFavorite;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                // contents
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: <Widget>[
                      // heading
                      Text(constraints.maxWidth.toString()),
                      Text(constraints.maxHeight.toString()),
                      const Text(
                        "Great Lake of Toba",
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // information
                      const Row(
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
                      const SizedBox(
                        height: 18,
                      ),
                      // description
                      const Text(
                        "Aliquip duis voluptate incididunt esse est anim aliquip. Cillum ut do aliqua aliquip minim ex Lorem adipisicing qui excepteur excepteur ex qui. Amet dolor dolore ut consequat magna cupidatat ut tempor. Excepteur est eu occaecat consectetur nulla. Incididunt voluptate magna aliqua sit mollit.",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      // image slider
                      isLarge ? Container() : const SliderImage(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SliderImage extends StatefulWidget {
  const SliderImage({Key? key}) : super(key: key);

  @override
  SliderImageState createState() => SliderImageState();
}

class SliderImageState extends State<SliderImage> {
  final scrollController = ScrollController();

  final List<String> images = [
    "https://source.unsplash.com/random/1280x720/?nature",
    "https://source.unsplash.com/random/1280x720/?nature",
    "https://source.unsplash.com/random/1280x720/?nature",
    "https://source.unsplash.com/random/1280x720/?nature",
    "https://source.unsplash.com/random/1280x720/?nature",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        controller: scrollController,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          }),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: ListView.builder(
              controller: scrollController,
              itemBuilder: (context, index) {
                final String imgURLs = images[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Image.network(imgURLs),
                );
              },
              itemCount: images.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
