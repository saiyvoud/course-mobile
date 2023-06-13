import 'package:course_mobile/components/colors.dart';
import 'package:flutter/foundation.dart';
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
      // appBar: AppBar(
      //   backgroundColor: primaryColorWhite,
      //   elevation: 0,
      //   centerTitle: true,
      //   title: Text(
      //     "Detail Product",
      //     style: TextStyle(fontSize: 18, color: primaryColorBlack),
      //   ),
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       color: primaryColorBlack,
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
    
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/product5.png",
              width: double.infinity,
             fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
