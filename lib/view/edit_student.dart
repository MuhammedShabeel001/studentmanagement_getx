import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test_1/functions/common_functions.dart';
import 'package:test_1/functions/db_functions.dart';
import 'package:test_1/functions/edit_functions.dart';
import 'package:test_1/functions/image_functions.dart';
import 'package:test_1/model/student_model.dart';
import 'package:test_1/widget/appbar.dart';
import 'package:test_1/widget/textfields.dart';

// ignore: must_be_immutable
class EditStudent extends StatelessWidget {
  EditStudent({super.key, this.studentDetails});
  EditController? studentDetails;

  EditController editController = Get.put(EditController());
  ImageController imageController = ImageController();
  StudentModelController student = StudentModelController();

  final GlobalKey<FormState> keyedit = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(context, 'Edit Student'),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: TextFieldWidget(
            formkey: keyedit,
            imageController: imageController,
            isFromEdit: false,
            nameController: editController.nameController.value,
            phoneController: editController.phoneController.value,
            batchController: editController.batchController.value,
          )
          // TextFieldWidget(
          //   formkey: keyedit,
          //   imageController: imageController,
          //   isFromEdit: true,
          //   nameController: editController.nameController.value,
          //   phoneController: editController.phoneController.value,
          //   batchController: editController.batchController.value,
          // ),
          ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          update(
            context,
            editController.id.value,
            editController.nameController.value,
            editController.phoneController.value,
            editController.batchController.value,
            keyedit,
            imageController,
            editController,
          );
          // EditStudent();
          // EditStudent();
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
