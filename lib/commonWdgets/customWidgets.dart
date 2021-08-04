import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomWidget {
  static SnackBarr(String title, String message) {
    return Get.snackbar(title.toString(), message.toString(),
        snackPosition: SnackPosition.TOP,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        backgroundColor: Colors.blue,
        colorText: Colors.white);
  }
}
