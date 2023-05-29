import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductComponent extends StatefulWidget {
  const ProductComponent({super.key});

  @override
  State<ProductComponent> createState() => _ProductComponentState();
}

class _ProductComponentState extends State<ProductComponent> {
  var data = [
    {
      "name": "product1",
      "desc": "desc1",
      "price": "150,000",
      "image": "assets/images/product1.png",
      "index": 3
    },
    {
      "name": "product2",
      "desc": "desc2",
      "price": "200,000",
      "image": "assets/images/product2.png",
      "index": 3.4
    },
    {
      "name": "product3",
      "desc": "desc3",
      "price": "250,000",
      "image": "assets/images/product3.png",
      "index": 3
    },
    {
      "name": "product4",
      "desc": "desc4",
      "price": "300,000",
      "image": "assets/images/product4.png",
      "index": 3.4
    },
    {
      "name": "product5",
      "desc": "desc5",
      "price": "350,000",
      "image": "assets/images/product5.png",
      "index": 3
    },
    {
      "name": "product6",
      "desc": "desc6",
      "price": "400,000",
      "image": "assets/images/product1.png",
      "index": 3.4
    },
    {
      "name": "product1",
      "desc": "desc1",
      "price": "150,000",
      "image": "assets/images/product1.png",
      "index": 3
    },
    {
      "name": "product2",
      "desc": "desc2",
      "price": "200,000",
      "image": "assets/images/product2.png",
      "index": 3.4
    },
    {
      "name": "product3",
      "desc": "desc3",
      "price": "250,000",
      "image": "assets/images/product3.png",
      "index": 3
    },
    {
      "name": "product4",
      "desc": "desc4",
      "price": "300,000",
      "image": "assets/images/product4.png",
      "index": 3.4
    },
    {
      "name": "product5",
      "desc": "desc5",
      "price": "350,000",
      "image": "assets/images/product5.png",
      "index": 3
    },
    {
      "name": "product6",
      "desc": "desc6",
      "price": "400,000",
      "image": "assets/images/product1.png",
      "index": 3.4
    },
  ];
  @override
  Widget build(BuildContext context) {
    // return MasonryGridView.builder(
    //   // mainAxisSpacing: 4,
    //   // crossAxisSpacing: 4,
      
    //   gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
        
    //   ),
    //   shrinkWrap: true,
    //   primary: false,
    //   itemCount: data.length,
      
    //   itemBuilder: (context, index) {
    //     return Card(
    //       child: Container(
    //         child: Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Image.asset(
    //                 "${data[index]['image']}",
    //                  fit: BoxFit.cover,
    //                  width: double.infinity,
    //               ),
    //               SizedBox(height: 10),
    //               Text("${data[index]['name']}"),
    //               SizedBox(height: 10),
    //               Text("${data[index]['desc']}"),
    //               SizedBox(height: 10),
    //               Text(
    //                 "${data[index]['price']} Lak",
    //                 style: TextStyle(
    //                   fontSize: 18,
    //                   color: Colors.red,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );

    return StaggeredGrid.count(
      crossAxisCount: 4,
      // mainAxisSpacing: 4,
      // crossAxisSpacing: 4,
      children: data.map((e) {
       double result = double.parse(e['index'].toString());
        return StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: result,
          child: Card(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "${e['image']}",
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    SizedBox(height: 10),
                    Text("${e['name']}"),
                    SizedBox(height: 10),
                    Text("${e['desc']}"),
                    SizedBox(height: 10),
                    Text(
                      "${e['price']} Lak",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
 
  }
}
