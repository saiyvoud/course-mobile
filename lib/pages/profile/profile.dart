import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:course_mobile/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (_, authProvider, __) {
      if (authProvider.loading == true) {
        return CircularProgressIndicator();
      }
      return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          actions: [
            IconButton(
                onPressed: () async {
                  await authProvider.logOut();
                  if (authProvider.sucess == true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginPage()));
                  } else {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.warning,
                      animType: AnimType.rightSlide,
                      title: 'ແຈ້ງເຕືອນ',
                      desc: 'ເກີດຂໍ້ຜິດພາດໃນການອອກລະບົບ!',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    )..show();
                  }
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
      );
    });
  }
}
