import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomWidget {
  // ignore: non_constant_identifier_names
  static SnackBarr(String title, String message) {
    return Get.snackbar(title.toString(), message.toString(),
        snackPosition: SnackPosition.TOP,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        backgroundColor: Colors.blue,
        colorText: Colors.white);
  }

  static dialogBox(String title, String message) {
    return Get.defaultDialog(
      title: title,
      middleText: message,
      backgroundColor: Colors.blue,
      titleStyle: TextStyle(color: Colors.white),
      middleTextStyle: TextStyle(color: Colors.white),
    );
  }
}
