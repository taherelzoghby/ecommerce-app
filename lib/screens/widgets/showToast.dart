import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToastt(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.black.withOpacity(.5),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
