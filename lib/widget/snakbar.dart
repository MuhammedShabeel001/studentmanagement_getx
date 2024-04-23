import 'package:flutter/material.dart';
import 'package:get/get.dart';

snackbar(String text) {
  Get.snackbar(
    animationDuration: const Duration(microseconds: 300000),
    duration: const Duration(seconds: 1),
    'Notification',
    colorText: Colors.white,
    text,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: const Color.fromARGB(255, 73, 71, 71),
    margin: const EdgeInsets.all(50),
  );
}