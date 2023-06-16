import 'package:course_mobile/components/colors.dart';
import 'package:flutter/material.dart';

class DetailHome extends StatefulWidget {
  const DetailHome({super.key});

  @override
  State<DetailHome> createState() => _DetailHomeState();
}

class _DetailHomeState extends State<DetailHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              //decoration: BoxDecoration(color: primaryColorGreen),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/product5.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 30,
                    left: 10,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primaryColorWhite,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ]),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: primaryColorBlack,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: 10,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColorWhite,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Center(
                        child: Icon(
                          Icons.shopping_bag,
                          color: primaryColorBlack,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 6,
                      blurRadius: 10,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "IPhone 14 Pro Max",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "TKGirl ใหม่ล่าสุด รองเท้าแตะน้องฉลามสีเรนโบว์มีให้เลือก ถึง 3แบบ🏳️‍🌈 🐳 สีสันสดใส พาสเทลบาดจุยมากแม่ จึ้งงงง",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        indent: 50,
                        endIndent: 50,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "LAK 20,000,000",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: primaryOrange),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width / 2.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber,
                              ),
                              child: Center(
                                child: Text(
                                  "ສັ່ງຊື້ເລີຍ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: primaryColorWhite,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width / 2.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primaryColorGreen,
                              ),
                              child: Center(
                                child: Text(
                                  "ໂທສອບຖາມ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: primaryColorWhite,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
