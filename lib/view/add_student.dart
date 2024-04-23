import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_1/functions/common_functions.dart';
import 'package:test_1/functions/db_functions.dart';
import 'package:test_1/functions/image_functions.dart';
import 'package:test_1/model/student_model.dart';
import 'package:test_1/widget/appbar.dart';
import 'package:test_1/widget/textfields.dart';

class AddStudent extends StatelessWidget {
  AddStudent({super.key});

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final batchController = TextEditingController();
  ImageController imageController = ImageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(context, 'Add Student'),
      body: TextFieldWidget(
        formkey: formkey,
        imageController: imageController,
        isFromEdit: false,
        nameController: nameController,
        phoneController: phoneController,
        batchController: batchController,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          addstudent(
            nameController,
            phoneController,
            batchController,
            imageController,
            formkey,
          );
          log('message');
        },
        label: const Text(
          'Done',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        icon: const Icon(
          Icons.done,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
      ),
    );
  }
}
