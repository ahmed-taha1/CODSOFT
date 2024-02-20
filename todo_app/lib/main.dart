import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/ui/pages/notification_screen.dart';
import 'ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.teal,
        backgroundColor: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: const NotificationScreen(payload: 'string'),
    );
  }
}
