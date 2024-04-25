import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/functions/db_functions.dart';
import 'package:test_1/model/student_model.dart';
import 'package:test_1/view/search_student.dart';
import 'package:test_1/widget/student_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<StudentModelController>().getAllStudent();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.purple.shade300,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search());
              },
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            )
          ],
          title: const Text(
            'Students',
            style:  TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/addStudent');
          },
          backgroundColor: Colors.purple.shade300,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: GetBuilder(
            init: StudentModelController(),
            builder: (controller) {
              final values = controller.students;
              List<StudentModel> reversedList = values.reversed.toList();
              return StudentListView(
                  reversedList: reversedList, controller: controller);
            },
          ),
        ));
  }
}
