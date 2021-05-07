import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/core/util/custom_carousel.dart';

class CarouselHeaderNonAsnWidget extends StatelessWidget {
  final List images = [
    'assets/images/banner1.jpeg',
    'assets/images/banner2.jpeg',
    'assets/images/banner3.jpeg'
  ];
  @override
  Widget build(BuildContext context) {
    return Carousel(
      height: 174,
      items: images,
      builderFunction: (context, item) {
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          child: Container(
              width: MediaQuery.of(context).size.width * 0.93,
              color: Colors.blue,
              child: Image.asset(
                item,
                fit: BoxFit.cover,
              )),
        );
      },
    );
  }
}
