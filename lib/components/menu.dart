import 'package:course_mobile/components/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';

class MenuComponent extends StatefulWidget {
  const MenuComponent({super.key});

  @override
  State<MenuComponent> createState() => _MenuComponentState();
}

class _MenuComponentState extends State<MenuComponent> {
  // dynamic data = [
  //   {
  //     "icon": "assets/icons/profile.png",
  //     "title": "All",
  //   },
  //   {
  //     "icon": "assets/icons/setting.png",
  //     "title": "Setting",
  //   },
  //   {
  //     "icon": "assets/icons/profile.png",
  //     "title": "All",
  //   },
  //   {
  //     "icon": "assets/icons/setting.png",
  //     "title": "Setting",
  //   },
  //   {
  //     "icon": "assets/icons/profile.png",
  //     "title": "All",
  //   },
  //   {
  //     "icon": "assets/icons/setting.png",
  //     "title": "Setting",
  //   }
  // ];

  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false)..fecthVehicle();
  }

  int currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (_, productProvider, __) {
      if (productProvider.loading == true) {
        return CircularProgressIndicator();
      }
      if (productProvider.productList == null) {
        return CircularProgressIndicator();
      }
      return Container(
        height: 80,
        width: double.infinity,
        // decoration: BoxDecoration(color: primaryOrange),
        child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: productProvider.vehicleList!.length,
            itemBuilder: (context, index) {
              final data = productProvider.vehicleList;
              return InkWell(
                onTap: () {
                  _onTap(index);
                  productProvider.fechProductByVehicle(
                      vehicleId: data[index].id!);
                },
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                          color: primaryColorWhite,
                          border: Border.all(
                              color: currentIndex == index
                                  ? Colors.orange
                                  : primaryColorWhite),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Image.network(
                            data![index].image!,
                            fit: BoxFit.cover,
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(width: 10),
                          Container(
                              // width: 50,
                              child: Text(
                            data[index].name!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 11),
                          ))
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              );
            }),
      );
    });
  }
}
