import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/helpers/spacing.dart';

import '../theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key, required this.payload}) : super(key: key);

  final String payload;

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String _payload = '';

  @override
  void initState() {
    super.initState();
    _payload = widget.payload;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        title: Text(_payload.toString().split('|')[0],
            style:
                TextStyle(color: Get.isDarkMode ? Colors.white : darkGreyClr)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace(20),
            Column(
              children: [
                Text(
                  "hello, Ahmed",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Get.isDarkMode ? Colors.white : darkGreyClr),
                ),
                verticalSpace(10),
                Text(
                  "You have new reminder",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Get.isDarkMode ? Colors.grey[100] : darkGreyClr),
                ),
              ],
            ),
            verticalSpace(10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: primaryClr,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Row (
                        children: [
                        ],
                      ),
                      verticalSpace(20)
                    ],
                  ),
                ),
              ),
            ),
            verticalSpace(10),
          ],
        ),
      ),
    );
  }
}
