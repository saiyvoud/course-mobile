import 'package:flutter/material.dart';

loading(context) {
  return showDialog(
      context: context,
      builder: (_) => Container(
        height: 120,
        child: AlertDialog(
              content: Column(children: [
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text("loading..")
              ]),
            ),
      ));
}
