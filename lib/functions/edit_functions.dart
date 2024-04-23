import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/model/student_model.dart';

class EditController extends GetxController {
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> batchController = TextEditingController().obs;

  RxString image = ''.obs;

  RxInt id = 0.obs;

  StudentModel? student;

  @override
  void onInit() {
    id.value = student!.id!;
    nameController.value.text = student!.name;
    phoneController.value.text = student!.phone;
    batchController.value.text = student!.batch;
    image.value = student?.image as String;
    super.onInit();
  }

  EditController({this.student});
}
