import 'package:course_mobile/pages/home/detail_home.dart';
import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';

class ProductComponent extends StatefulWidget {
  const ProductComponent({super.key});

  @override
  State<ProductComponent> createState() => _ProductComponentState();
}

class _ProductComponentState extends State<ProductComponent> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false)..fecthProduct();
  }

  // var data = [
  //   {
  //     "name": "product1",
  //     "desc": "desc1",
  //     "price": "150,000",
  //     "image": "assets/images/product1.png",
  //     "index": 3
  //   },
  //   {
  //     "name": "product2",
  //     "desc": "desc2",
  //     "price": "200,000",
  //     "image": "assets/images/product2.png",
  //     "index": 3.4
  //   },
  //   {
  //     "name": "product3",
  //     "desc": "desc3",
  //     "price": "250,000",
  //     "image": "assets/images/product3.png",
  //     "index": 3
  //   },
  //   {
  //     "name": "product4",
  //     "desc": "desc4",
  //     "price": "300,000",
  //     "image": "assets/images/product4.png",
  //     "index": 3.4
  //   },
  //   {
  //     "name": "product5",
  //     "desc": "desc5",
  //     "price": "350,000",
  //     "image": "assets/images/product5.png",
  //     "index": 3
  //   },
  //   {
  //     "name": "product6",
  //     "desc": "desc6",
  //     "price": "400,000",
  //     "image": "assets/images/product1.png",
  //     "index": 3.4
  //   },
  //   {
  //     "name": "product1",
  //     "desc": "desc1",
  //     "price": "150,000",
  //     "image": "assets/images/product1.png",
  //     "index": 3
  //   },
  //   {
  //     "name": "product2",
  //     "desc": "desc2",
  //     "price": "200,000",
  //     "image": "assets/images/product2.png",
  //     "index": 3.4
  //   },
  //   {
  //     "name": "product3",
  //     "desc": "desc3",
  //     "price": "250,000",
  //     "image": "assets/images/product3.png",
  //     "index": 3
  //   },
  //   {
  //     "name": "product4",
  //     "desc": "desc4",
  //     "price": "300,000",
  //     "image": "assets/images/product4.png",
  //     "index": 3.4
  //   },
  //   {
  //     "name": "product5",
  //     "desc": "desc5",
  //     "price": "350,000",
  //     "image": "assets/images/product5.png",
  //     "index": 3
  //   },
  //   {
  //     "name": "product6",
  //     "desc": "desc6",
  //     "price": "400,000",
  //     "image": "assets/images/product1.png",
  //     "index": 3.4
  //   },
  // ];
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (_, productProvider, __) {
      if (productProvider.productLoading == true) {
        return CircularProgressIndicator();
      }
      if (productProvider.productList!.length == 0 ||
          productProvider.productList == null) {
        return CircularProgressIndicator();
      }
      return MasonryGridView.builder(
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        shrinkWrap: true,
        primary: false,
        itemCount: productProvider.productList!.length,
        itemBuilder: (context, index) {
          final data = productProvider.productList;
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailHome(
                    productModel: data[index],
                  ),
                ),
              );
            },
            child: Card(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "${data![index].image}",
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      SizedBox(height: 10),
                      Text("${data[index].name}"),
                      SizedBox(height: 10),
                      Text("${data[index].detail}"),
                      SizedBox(height: 10),
                      Text(
                        "${data[index].price} Lak",
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
        },
      );
    });

    // return Consumer<ProductProvider>(builder: (_, productProvider, __) {
    //   if (productProvider.productLoading == true) {
    //     return CircularProgressIndicator();
    //   }
    //   return StaggeredGrid.count(
    //     crossAxisCount: 4,
    //     children: productProvider.productList!.map((e) {
    //       return StaggeredGridTile.count(
    //         crossAxisCellCount: 2,
    //         mainAxisCellCount: 3,
    //         child: Card(
    //           child: Container(
    //             child: Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Image.network(
    //                     "${e.image}",
    //                     fit: BoxFit.cover,
    //                     width: double.infinity,
    //                   ),
    //                   SizedBox(height: 10),
    //                   Text("${e.name}"),
    //                   SizedBox(height: 10),
    //                   Text("${e.detail}"),
    //                   SizedBox(height: 10),
    //                   Text(
    //                     "${e.price.toString()} Lak",
    //                     style: TextStyle(
    //                       fontSize: 18,
    //                       color: Colors.red,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       );
    //     }).toList(),
    //   );
    // });
  }
}
