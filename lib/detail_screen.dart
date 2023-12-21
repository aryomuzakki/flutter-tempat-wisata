import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tempat_wisata/components/slider_image.dart';
import 'package:tempat_wisata/model/tourism_place.dart';

class DetailScreen extends StatefulWidget {
  final TourismPlace place;

  const DetailScreen({Key? key, required this.place}) : super(key: key);

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
                            child: Image.asset(
                              widget.place.imageAsset,
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
                                  // back button icon
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
                                  // mark favorite button
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
                      Text(
                        widget.place.name,
                        style: const TextStyle(
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // information
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Icon(Icons.date_range_outlined),
                              const SizedBox(height: 6),
                              Text(widget.place.openDays),
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(Icons.watch_later_outlined),
                              const SizedBox(height: 6),
                              Text(widget.place.openTime),
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(Icons.attach_money_outlined),
                              const SizedBox(height: 6),
                              Text(widget.place.ticketPrice),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      // description
                      Text(
                        widget.place.description,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      // image slider
                      isLarge
                          ? Container()
                          : SliderImage(images: widget.place.imageUrls),
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
