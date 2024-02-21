import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/helpers/spacing.dart';
import 'package:todo_app/logic/controllers/task_controller.dart';
import 'package:todo_app/ui/size_config.dart';
import 'package:todo_app/ui/widgets/home_view_widgets/home_app_bar.dart';
import 'package:todo_app/ui/widgets/home_view_widgets/home_task_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: HomeAppBar(),
      body: Column(
        children: [
          HomeTaskBar(),
          // HomeDateBar(),
          verticalSpace(8),
          // HomeTasks(),
        ],
      ),
    );
  }
}
