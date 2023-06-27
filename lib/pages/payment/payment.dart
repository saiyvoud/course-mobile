import 'package:course_mobile/components/colors.dart';
import 'package:course_mobile/provider/auth_provider.dart';
import 'package:course_mobile/router/router.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/product_model.dart';
import '../../provider/product_provider.dart';

class Payment extends StatefulWidget {
  final ProductModel productModel;
  const Payment({super.key, required this.productModel});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  void initState() {
   
    super.initState();
    Provider.of<AuthProvider>(context, listen: false)..getProfile();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (_, productProvider, __) {
      if (productProvider.productLoading == true) {
        return CircularProgressIndicator();
      }
      return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColors,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: primaryColorBlack,
              )),
          title: Text(
            'payment',
            style: TextStyle(
              color: primaryColorBlack,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.call, color: primaryColorBlack),
                    SizedBox(width: 5),
                    Text('ຊ່ອງທາງຕິດຕໍ່',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Spacer(),
                    Icon(Icons.edit, color: Colors.green),
                  ],
                ),
                SizedBox(height: 10),
                Consumer<AuthProvider>(builder: (_, authProvider, __) {
                  if (authProvider.loading == true) {
                    return CircularProgressIndicator();
                  }
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ຊື່ ແລະ ນາມສະກຸນ',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                            Text('${authProvider.userModel.firstName} ${authProvider.userModel.lastName }',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ເບີໂທຕິດຕໍ່',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                            Text('+856 ${authProvider.userModel.phoneNumber}',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                          ],
                        ),
                      ),
                     
                    ],
                  );
                }),
                SizedBox(height: 10),
                Container(
                  height: 10,
                  decoration: BoxDecoration(color: Colors.grey.shade100),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.time_to_leave, color: primaryColorBlack),
                    SizedBox(width: 5),
                    Text('ເວລາຈັດສົ່ງສິນຄ້າ',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Spacer(),
                    Icon(Icons.edit, color: Colors.green),
                  ],
                ),
                SizedBox(height: 10),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 5),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text('ວັນທີ່ຈັດສົ່ງ',
                //           style: TextStyle(fontSize: 12, color: Colors.black)),
                //       Text('10-01-2023',
                //           style: TextStyle(fontSize: 12, color: Colors.black)),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 5),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text('ເວລາຈັດສົ່ງ',
                //           style: TextStyle(fontSize: 12, color: Colors.black)),
                //       Text('10:00 - 20:00',
                //           style: TextStyle(fontSize: 12, color: Colors.black)),
                //     ],
                //   ),
                // ),
                // SizedBox(height: 10),
               
                Container(
                  height: 10,
                  decoration: BoxDecoration(color: Colors.grey.shade100),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.map, color: primaryColorBlack),
                    SizedBox(width: 5),
                    Text('ສະຖານທີ່ຈັດສົ່ງສິນຄ້າ',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouterAPI.address);
                      },
                      icon: Icon(Icons.edit, color: Colors.green),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('ບ້ານ ເມືອງ ແຂວງ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                          Text('ຫ້ວຍຫົງ ຈັນທະບູລີ ນະຄອນຫຼວງວຽງຈັນ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('ປະເພດທີ່ຢູ່ອາໄສ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                          Text('ບ້ານ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 120,
                  decoration: BoxDecoration(color: primaryColors),
                ),
                SizedBox(height: 10),
                Container(
                  height: 10,
                  decoration: BoxDecoration(color: Colors.grey.shade100),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.list_alt, color: primaryColorBlack),
                    SizedBox(width: 5),
                    Text('ລາຍລະອຽດສິນຄ້າ',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Spacer(),
                    Icon(Icons.edit, color: Colors.green),
                  ],
                ),
                Consumer<ProductProvider>(builder: (_, productProvider, __) {
                  if (productProvider.productLoading == true) {
                    return CircularProgressIndicator();
                  }
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ຮູບສິນຄ້າ',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                            Text('ຊື່',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                            Text('ລາຄາ',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              widget.productModel.image!,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                            Text('${widget.productModel.name}',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                            Text('${widget.productModel.price} LAK',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ລາຄາລວມ',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                            Text('${widget.productModel.price} Kip',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  );
                })
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          decoration: BoxDecoration(
            color: primaryColors,
          ),
          child: Center(
            child: Text(
              'ຊຳລະເງີນ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColorBlack,
              ),
            ),
          ),
        ),
      );
     });
  }
}
