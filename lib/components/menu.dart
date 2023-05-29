import 'package:course_mobile/components/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class MenuComponent extends StatefulWidget {
  const MenuComponent({super.key});

  @override
  State<MenuComponent> createState() => _MenuComponentState();
}

class _MenuComponentState extends State<MenuComponent> {
  dynamic data = [
    {
      "icon": "assets/icons/profile.png",
      "title": "All",
    },
    {
      "icon": "assets/icons/setting.png",
      "title": "Setting",
    },
    {
      "icon": "assets/icons/profile.png",
      "title": "All",
    },
    {
      "icon": "assets/icons/setting.png",
      "title": "Setting",
    },
    {
      "icon": "assets/icons/profile.png",
      "title": "All",
    },
    {
      "icon": "assets/icons/setting.png",
      "title": "Setting",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
     // decoration: BoxDecoration(color: primaryOrange),
      child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                SizedBox(width: 10),
                Container(
                  height: 60,
                  width: 100,
                  decoration: BoxDecoration(
                      color: primaryColorWhite,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Image.asset(data[index]['icon'],fit: BoxFit.cover,height: 30,width: 30,),
                      SizedBox(width: 10),
                      Text(data[index]['title'])
                    ],
                  ),
                ),
                SizedBox(width: 5),
              ],
            );
          }),
    );
  }
}
