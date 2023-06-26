import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:course_mobile/components/colors.dart';
import 'package:course_mobile/router/router.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _eye = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("ລົງທະບຽນ"),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (_) => AuthProvider(),
        child: Consumer<AuthProvider>(builder: (_, authProvider, __) {
          if (authProvider.loading == true) {
            return CircularProgressIndicator();
          } else {
            return SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/login.png",
                          height: 200,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "ລົງທະບຽນເຂົ້າສູ່ລະບົບ",
                        style: TextStyle(
                          color: primaryColorBlack,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "ຊື່",
                        style: TextStyle(
                          color: primaryColorBlack,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade300),
                        child: TextFormField(
                          controller: firstName,
                          
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              hintText: "ຊື່ຂອງທ່ານ",
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.person)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "ຊື່ຫ້າມວ່າງ";
                            }
                            return null;
                          },
                        ),
                      ),
                      Text(
                        "ນາມສະກຸນ",
                        style: TextStyle(
                          color: primaryColorBlack,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade300),
                        child: TextFormField(
                          controller: lastName,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              hintText: "ນາມສະກຸນຂອງທ່ານ",
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.person)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "ນາມສະກຸນຫ້າມວ່າງ";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "ເບີໂທລະສັບ",
                        style: TextStyle(
                          color: primaryColorBlack,
                          fontSize: 18,
                        ),
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
                              hintText: "20 xxxxxx",
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.call)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "ຊື່ຫ້າມວ່າງ";
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
                              backgroundColor:
                                  MaterialStateProperty.all(primaryColors),
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await authProvider.otp(
                                  firstName: firstName.text.trim(),
                                  lastName: lastName.text.trim(),
                                  phoneNumber: phoneNumber.text.trim(),
                                  password: password.text.trim(),
                                );
                                if (authProvider.sucess == true) {
                                  Navigator.pushNamed(context, RouterAPI.otp);
                                } else {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.warning,
                                    animType: AnimType.rightSlide,
                                    title: 'ແຈ້ງເຕືອນ',
                                    desc:
                                        'ເກີດຂໍ້ຜິດພາດໃນການລົງທະບຽນ',
                                    btnCancelOnPress: () {},
                                    btnOkOnPress: () {},
                                  )..show();
                                }
                              }
                            },
                            child: Text(
                              "ລົງທະບຽນ",
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
