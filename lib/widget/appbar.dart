import 'package:flutter/material.dart';

AppBar myAppbar(BuildContext context, String title) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.purple.shade300,
    centerTitle: true,
  
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}
