import 'package:flutter/material.dart';
import 'package:test_1/functions/image_functions.dart';
import 'package:test_1/widget/appbar.dart';
import 'package:test_1/widget/textfields.dart';

// ignore: must_be_immutable
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
    );
  }
}
