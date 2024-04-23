import 'dart:developer';

import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_1/model/student_model.dart';

class StudentModelController extends GetxController {
  RxList<StudentModel> students = <StudentModel>[].obs;
  late Database _db;

  Future<void> initializingDB() async {
    _db = await openDatabase('student.db', version: 1,
        onCreate: (Database db, int version) {
      db.execute('''CREATE TABLE student(
          id INTEGER PRIMARY KEY,
          name TEXT,
          phone TEXT,
          batch TEXT,
          image TEXT
        )''');
    });
  }

  Future<void> addStudent(StudentModel value) async {
    await _db.execute(
        'INSERT INTO student(name,phone,batch,image)VALUES(?,?,?,?)',
        [value.name, value.phone, value.batch, value.image]);

    getAllStudent();
  }

  Future<void> getAllStudent() async {
    final values = await _db.rawQuery('SELECT * FROM student');
    log('$values');
    // log('');
    students.clear();
    for (var map in values) {
      final student = StudentModel.fromMap(map);
      students.add(student);
    }

    update();
  }

  Future<void> deleteStudent(int id) async {
    await _db.delete("student", where: "id=?", whereArgs: [id]);
    getAllStudent();
  }

  Future<void> updateStudent(
      int id, String name, String phone, String batch, String image) async {
    final data = {
      'name': name,
      'phone': phone,
      'batch': batch,
      'image': image,
    };
    await _db.update('student', data, where: 'id=?', whereArgs: [id]);
    log('updated');
    getAllStudent();
    update();
  }
}
