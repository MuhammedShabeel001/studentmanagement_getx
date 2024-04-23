import 'package:flutter/material.dart';
import 'package:test_1/functions/db_functions.dart';
import 'package:test_1/view/add_student.dart';
import 'package:test_1/view/home_page.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'package:test_1/view/show_details.dart';

Future<void> main() async {
  Get.lazyPut(() => StudentModelController());
  WidgetsFlutterBinding.ensureInitialized();
  await Get.find<StudentModelController>().initializingDB();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: '/addStudent',
          page: () => AddStudent(),
        ),
        
      ],
      home: const HomeScreen(),
    );
  }
}
