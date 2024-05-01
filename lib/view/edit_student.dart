import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/functions/db_functions.dart';
import 'package:test_1/functions/edit_functions.dart';
import 'package:test_1/functions/image_functions.dart';
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
      body: TextFieldWidget(
        editController: editController,
        formkey: keyedit,
        imageController: imageController,
        isFromEdit: true,
        nameController: editController.nameController.value,
        phoneController: editController.phoneController.value,
        batchController: editController.batchController.value,
      ),
    );
  }
}
