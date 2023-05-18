import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_mobile/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BannerComponent extends StatefulWidget {
  const BannerComponent({super.key});

  @override
  State<BannerComponent> createState() => _BannerComponentState();
}

class _BannerComponentState extends State<BannerComponent> {
  int currentIndex = 0;
  var data = [
    'assets/images/banner1.png',
    'assets/images/banner2.png',
    'assets/images/banner3.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _banner(),
        SizedBox(height: 5),
        _indicator(),
      ],
    );
  }

  _indicator() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: data.map((e) {
          var index = data.indexOf(e);
          return Container(
            width: 10,
            height: currentIndex == index ? 8 : 2,
            margin: EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
                color: currentIndex == index ? primaryOrange : Colors.grey,
                shape: currentIndex == index
                    ? BoxShape.circle
                    : BoxShape.rectangle),
          );
        }).toList());
  }

  _banner() {
    return Container(
      height: 140,
      width: double.infinity,
      child: CarouselSlider(
          items: data.map((item) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Image.asset(
                item,
                fit: BoxFit.cover,
              ),
            );
          }).toList(),
          options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              autoPlayAnimationDuration: Duration(seconds: 1),
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              })),
    );
  }
}
