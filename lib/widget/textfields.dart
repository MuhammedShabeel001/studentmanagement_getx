import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test_1/functions/common_functions.dart';
import 'package:test_1/functions/edit_functions.dart';
import 'package:test_1/functions/image_functions.dart';

class TextFieldWidget extends StatelessWidget {
  final GlobalKey formkey;
  final ImageController imageController;
  final bool isFromEdit;
  final EditController? editController;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController batchController;

  const TextFieldWidget({
    super.key,
    required this.formkey,
    required this.imageController,
    required this.isFromEdit,
    required this.nameController,
    required this.phoneController,
    required this.batchController,
    this.editController,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          key: formkey,
          child: Column(
            children: [
              Stack(
                children: [
                  Obx(() => isFromEdit == true
                      ? CircleAvatar(
                          radius: 50,
                          backgroundImage: imageController.istrue.value == true
                              ? FileImage(imageController.image1!.value)
                              : FileImage(File(editController!.image.value)),
                        )
                      : CircleAvatar(
                          radius: 50,
                          backgroundImage: imageController.istrue.value == true
                              ? FileImage(imageController.image1!.value)
                              : const AssetImage('assets/images/graduated.png')
                                  as ImageProvider,
                        )),
                  Positioned(
                    bottom: -10,
                    right: -12,
                    child: IconButton(
                        onPressed: () {
                          pickimages(imageController);
                        },
                        icon: const Icon(Icons.add_a_photo)),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(
                        15), // Limit to 15 characters
                  ],
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 20),
                      suffix: const Icon(Icons.person),
                      label: const Text('Name'),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(),
                        borderRadius: BorderRadius.circular(12),
                      ))),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(
                      10), // Limit to 10 characters
                ],
                controller: phoneController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  suffix: const Icon(Icons.phone),
                  label: const Text('Phone'),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6), // Limit to 6 characters
                ],
                controller: batchController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the batch';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  suffix: const Icon(Icons.group),
                  label: const Text('Batch'),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
