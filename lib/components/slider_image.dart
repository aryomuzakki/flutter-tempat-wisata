import 'dart:ui';

import 'package:flutter/material.dart';

class SliderImage extends StatefulWidget {
  final List<String> images;

  const SliderImage({Key? key, required this.images}) : super(key: key);

  @override
  SliderImageState createState() => SliderImageState();
}

class SliderImageState extends State<SliderImage> {
  final scrollController = ScrollController();

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
                final String imgURLs = widget.images[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Image.network(imgURLs),
                );
              },
              itemCount: widget.images.length,
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
