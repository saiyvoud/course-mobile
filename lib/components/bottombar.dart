import 'package:course_mobile/pages/home/home.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currenwidget = 0;
  List<Widget> _children = [
    HomePage(), // 0
    Container(
      height: 200,
      decoration: BoxDecoration(color: Colors.red),
    ), // 1
    Container(
      height: 200,
      decoration: BoxDecoration(color: Colors.red),
    ), //2
  ];
  void _onTap(int index) {
    setState(() {
      _currenwidget = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currenwidget],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        selectedLabelStyle: TextStyle(fontSize: 12, color: Colors.white),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currenwidget,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "ໜ້າຫຼັກ",
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                  ),
                ),
                Icon(Icons.shopping_bag),
              ],
            ),
            label: "ອໍເດີຂອງຂ້ອຍ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
