import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:course_mobile/components/colors.dart';
import 'package:course_mobile/router/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController otp = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int start = 0;
  bool time = false;

  @override
  void initState() {
    super.initState();
    // Provider.of<AuthProvider>(context)..sendOTP();
    sendOTP();
    startTime();
  }

  Future<void> startTime() async {
    if (mounted)
      setState(() {
        start = 60;
      });
    var second = Duration(seconds: 1);
    Timer.periodic(second, (timer) {
      if (start == 0) {
        if (mounted)
          setState(() {
            timer.cancel();
            time = false;
          });
      } else {
        if (mounted)
          setState(() {
            start--;
          });
      }
    });
  }

  final auth = FirebaseAuth.instance;

  var _verificationId;
  Future<void> sendOTP() async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: "+8562096794376",
        //timeout: Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          ///

          print("======> Success");
        },
        verificationFailed: (error) {
          print('=====>Error Send OTP${error}');
        },
        codeSent: (verificationId, forceResendingToken) {
          setState(() {
            _verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (verificationId) {
          setState(() {
            _verificationId = verificationId;
          });
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ຢືນຢັນລະຫັດ'),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider<AuthProvider>(
        create: (_) => AuthProvider(),
        child: Consumer<AuthProvider>(
          builder: (_, authProvider, __) {
            if (authProvider.loading == true) {
              return CircularProgressIndicator();
            } else {
              return SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Center(
                            child: Image.asset(
                          "assets/images/login.png",
                          height: 200,
                        )),
                        Text(
                          "ກະລຸນາກວດສອບບັນຊີຂອງທ່ານ",
                          style: TextStyle(
                            fontSize: 18,
                            color: primaryColorBlack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "ພວກເຮົາໄດ້ສົ່ງລະຫັດການເຂົ້າເຖິງໃຫ້ທ່ານຜ່ານທາງ"
                          "sms ຫຼືການຢືນຢັນເບີໂທລະສັບ",
                          style: TextStyle(
                            fontSize: 15,
                            color: primaryColorBlack,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: PinCodeTextField(
                              appContext: context,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 45,
                                fieldWidth: 45,
                                activeFillColor: primaryColorWhite,
                                activeColor: primaryColorWhite,
                                selectedColor: Colors.blue,
                                selectedFillColor: primaryColorWhite,
                                inactiveColor: primaryColorWhite,
                                inactiveFillColor: primaryColorWhite,
                              ),
                              cursorColor: Color(0xff616161),
                              controller: otp,
                              enableActiveFill: true,
                              keyboardType: TextInputType.phone,
                              boxShadows: [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ],
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "ລະຫັດບໍ່ອະນຸຍາດໃຫ້ວ່າງ";
                                } else if (value.length < 6) {
                                  return "ລະຫັດຕ້ອງເປັນ 6 ຕົວເລກ";
                                }
                                return null;
                              },
                              length: 6,
                              onCompleted: (v) async {
                                if (formKey.currentState!.validate()) {
                                  ///=====>
                                  await authProvider.verifyOTP(otp: otp.text);
                                  if (authProvider.sucess == true) {
                                    Navigator.pushNamed(
                                        context, RouterAPI.home);
                                  } else {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.warning,
                                      animType: AnimType.rightSlide,
                                      title: 'ແຈ້ງເຕືອນ',
                                      desc: 'ເກີດຂໍ້ຜິດພາດໃນການ otp',
                                      btnCancelOnPress: () {},
                                      btnOkOnPress: () {},
                                    )..show();
                                  }
                                }
                              },
                              beforeTextPaste: (text) {
                                return true;
                              },
                              onChanged: (value) {
                                setState(() {});
                              }),
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          child: Text(
                            'ສົ່ງລະຫັດອີກຄັ້ງ> ${start}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                          onPressed: () {
                            /// =====>
                            startTime();
                            if (start == 0) {
                              AuthProvider()..sendOTP();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
