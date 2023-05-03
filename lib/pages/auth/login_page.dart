// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:course_mobile/pages/home/home.dart';
import 'package:course_mobile/provider/auth_provider.dart';
import 'package:course_mobile/service/user_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _eye = true;
  // final //  ແມ່ນ parameter ຄົງທີ່ທີ່ບໍ່ມີຄ່າເລີ່ມ
  //var  // ແມ່ນ parameter ທີ່ບໍ່ແນ່ນອນ,
  // const // ແມ່ນ parameter ຄົງທີ່ທີ່ມີຄ່າເລີ່ມຕົ້ນ
  // dynamic //  ແມ່ນ parameter ທີ່ບໍ່ແນ່ນອນ,
  // List // ແມ່ນ parameter ທີ່ເກັບຂໍ້ມູນເປັນ list[], Widget , late // ແມ່ນ parameter ຄົງທີ່ທີ່ບໍ່ມີຄ່າເລີ່ມ ,
  final formKey = GlobalKey<FormState>();
  final user = UserAPI();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   final auth = Provider<AuthProvider>(context);
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => AuthProvider(),
        child: Consumer<AuthProvider>(builder: (_, authProvider, __) {
          if (authProvider.loading == true) {
            return CircularProgressIndicator();
          } else {
            return Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 80),
                      Center(
                        child: Image.asset(
                          "assets/images/login.png",
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "ເຂົ້າສູ່ລະບົບຂອງທ່ານ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "ເບີໂທລະສັບ",
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade300),
                        child: TextFormField(
                          controller: phoneNumber,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              hintText: "+856 20 xxxxxx",
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.call)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "ເບີໂທຫ້າມວ່າງ";
                            } else if (value.length == 10) {
                              return null;
                            }
                            return "ເບີໂທຕ້ອງເປັນ 10 ຕົວເລກ";
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("ລະຫັດຜ່ານ"),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade300),
                        child: TextFormField(
                          controller: password,
                          obscureText: _eye,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.security),
                            hintText: "*********",
                            suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                setState(() {
                                  _eye = !_eye;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "ລະຫັດຜ່ານຫ້າມວ່າງ";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width / 1,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor:
                                  MaterialStateProperty.all(Colors.red),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green),
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                authProvider.login(
                                  phoneNumber: phoneNumber.text,
                                  password: password.text,
                                );
                              }
                            },
                            child: Text(
                              "ເຂົ້າສູ່ລະບົບ",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
