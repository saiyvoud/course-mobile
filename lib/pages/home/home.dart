import 'package:course_mobile/components/banner.dart';
import 'package:course_mobile/components/colors.dart';
import 'package:course_mobile/components/menu.dart';

import 'package:course_mobile/components/styple.dart';
import 'package:flutter/material.dart';

import '../../components/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColorWhite,
        leading: Icon(
          Icons.category,
          color: primaryOrange,
        ),
        centerTitle: true,
        title: Text(
          "Home",
          style: textStyle(
            fontSize: 18,
            color: primaryColorBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: primaryOrange,
                  borderRadius: BorderRadius.circular(40)),
              child: Center(
                  child: Icon(
                Icons.notification_add,
                size: 20,
              )),
            ),
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: primaryOrange,
            backgroundImage: AssetImage("assets/icons/profile.png"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                        color: primaryColorWhite,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Search...",
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.search)),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: primaryOrange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/icons/setting.png",
                      height: 25,
                      color: primaryColorWhite,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            BannerComponent(),
            SizedBox(height: 10),
            MenuComponent(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Popular",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ProductComponent(),
          ],
        ),
      ),
    );
  }
}
