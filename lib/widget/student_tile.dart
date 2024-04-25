import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/functions/db_functions.dart';
import 'package:test_1/functions/edit_functions.dart';
import 'package:test_1/model/student_model.dart';
import 'package:test_1/view/edit_student.dart';
import 'package:test_1/widget/student_detailes.dart';
import 'package:test_1/widget/snakbar.dart';

// ignore: must_be_immutable
class StudentListView extends StatelessWidget {
  List<StudentModel> reversedList;
  StudentModelController controller;
  StudentListView(
      {super.key, required this.reversedList, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          final data = reversedList[index];
          return Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(13)),
              child: ListTile(
                onTap: () {
                  Get.to(Details(studentdetails: data));
                },
                contentPadding: const EdgeInsets.only(left: 12),
                leading: CircleAvatar(
                  radius: 40,
                  backgroundImage: FileImage(File(data.image)),
                ),
                title: Text('Name : ${data.name}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),maxLines: 1,overflow: TextOverflow.ellipsis,),
                subtitle: Text('Batch : ${data.batch}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.lazyPut(() => EditController(student: data));

                          Get.to(() => EditStudent());
                        },
                        icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () async {
                          Get.defaultDialog(
                              title: 'Alert',
                              titleStyle: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                              content: const Text(
                                'Do you want to delete ?',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              backgroundColor: Colors.purple.shade500,
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text('No',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)))),
                                TextButton(
                                    onPressed: () async {
                                      await controller.deleteStudent(data.id!);
                                      Get.back();
                                      snackbar(
                                          'Successfully Deleted ${data.name}');
                                    },
                                    child: const Text(
                                      'Yes',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    )),
                              ]);
                        },
                        icon: const Icon(Icons.delete))
                  ],
                ),
              ));
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 3,
            ),
        itemCount: controller.students.length);
  }
}
