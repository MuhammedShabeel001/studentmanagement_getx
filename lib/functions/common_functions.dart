import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/functions/db_functions.dart';

import 'package:test_1/functions/image_functions.dart';
import 'package:test_1/model/student_model.dart';
import 'package:test_1/widget/snakbar.dart';

Future<void> addstudent(
  nameController,
  phoneController,
  batchController,
  imageController,
  formkey,
) async {
  final name = nameController.text.trim();
  final phone = phoneController.text.trim();
  final batch = batchController.text.trim();

  if (formkey.currentState!.validate() &&
      imageController.istrue.value != false) {
    final studentValues = StudentModel(
      name: name,
      phone: phone,
      batch: batch,
      image: imageController.image!.value,
    );

    await Get.find<StudentModelController>().addStudent(studentValues);
    Get.back();

    log('summitted');
    snackbar('Summitted');
  } else {
    snackbar('Failed to summit');
    log('failed');
  }
}

Future<void> update(ctx, id, namecontroller, phonecontroller, batchcontroller,
    keyedit, imageController, editcontroller) async {
  final name = namecontroller.text.trim();
  final phone = phonecontroller.text.trim();
  final batch = batchcontroller.text.trim();

  if (keyedit.currentState!.validate()) {
    await Get.find<StudentModelController>().updateStudent(
        id,
        name,
        phone,
        batch,
        imageController.istrue.value
            ? imageController.image!.value
            : editcontroller.image.value);
    Get.back();
    editcontroller.namecontroller.value.text = '';
    editcontroller.phonecontroller.value.text = '';
    editcontroller.batchcontroller.value.text = '';
    imageController.istrue.value = false;
    snackbar('Updated');
  }
}

pickimages(ImageController imageController) {
  Get.defaultDialog(
      title: 'Alert',
      titleStyle: const TextStyle(
          fontSize: 19, fontWeight: FontWeight.w400, color: Colors.white),
      backgroundColor: Colors.purple.shade500,
      content: const Text(
        'Photo options',
        style:
            TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 16),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              imageController.fromCamera();
            },
            child: const Text(
              'Camera',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            )),
        ElevatedButton(
          onPressed: () {
            imageController.fromGallery();
          },
          child: const Text(
            'Gallery',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        )
      ]);
}
