import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../helpers/spacing.dart';
import '../../theme.dart';

class AddTaskViewAppBar extends StatefulWidget implements PreferredSizeWidget {
  const AddTaskViewAppBar({Key? key}) : super(key: key);

  @override
  State<AddTaskViewAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _HomeAppBarState extends State<AddTaskViewAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: primaryClr, size: 24),
        onPressed: () => Get.back(),
      ),
      actions: [
        const CircleAvatar(
          backgroundImage: AssetImage('images/person.jpeg'),
          radius: 20,
        ),
        horizontalSpacing(20),
      ],
    );
  }
}