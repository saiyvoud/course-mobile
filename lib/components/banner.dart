import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_mobile/components/colors.dart';
import 'package:course_mobile/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false)..fecthBanner();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (_, productProvider, __) {
      if (productProvider.loading == true) {
        return CircularProgressIndicator();
      }
      return Column(
        children: [
          _banner(productProvider),
          SizedBox(height: 5),
          //  _indicator(productProvider),
        ],
      );
    });
  }

  _indicator(ProductProvider productProvider) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productProvider.bannerList!.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Container(
                width: 10,
                height: currentIndex == index ? 8 : 2,
                margin: EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                    color: currentIndex == index ? primaryOrange : Colors.grey,
                    shape: currentIndex == index
                        ? BoxShape.circle
                        : BoxShape.rectangle),
              ),
            ],
          );
        });
  }

  _banner(ProductProvider productProvider) {
    return Container(
      height: 140,
      width: double.infinity,
      child: CarouselSlider.builder(
          itemCount: productProvider.bannerList!.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Image.network(
                productProvider.bannerList![index].image!,
                fit: BoxFit.cover,
              ),
            );
          },
          options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              autoPlayAnimationDuration: Duration(seconds: 1),
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              })),
      // items: data.map((item) {
      //   return Container(
      //     padding: EdgeInsets.symmetric(horizontal: 5),
      //     child: Image.asset(
      //       item,
      //       fit: BoxFit.cover,
      //     ),
      //   );
      // }).toList(),
    );
  }
}
