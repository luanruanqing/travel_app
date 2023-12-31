import 'package:flutter/material.dart';
import 'package:travel_app/widgets/big_text.dart';
import 'package:get/get.dart';

void ShowCustomSnackBar(String message, {bool isError = true, String title = "Error"}) {
  Get.snackbar(
    title,
    message,
    titleText: BigText(text: title, color: Colors.white),
    messageText: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Color(0xFF5c525f),
  );
}
