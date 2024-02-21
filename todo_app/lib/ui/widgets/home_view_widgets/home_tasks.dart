import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/helpers/size_config.dart';
import 'package:todo_app/logic/services/notification_services.dart';
import 'package:todo_app/ui/pages/home_page.dart';
import 'package:todo_app/ui/widgets/home_view_widgets/show_task.dart';
import 'package:todo_app/ui/widgets/home_view_widgets/task_tile.dart';
import '../../../data/models/task.dart';
import '../../../logic/controllers/task_controller.dart';
import 'no_task_message.dart';

class HomeTasks extends StatefulWidget {
  HomeTasks({super.key, required this.selectedDate});

  final DateTime selectedDate;
  @override
  State<HomeTasks> createState() => _HomeTasksState();
}

class _HomeTasksState extends State<HomeTasks> {
  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () {
          if (_taskController.taskList.isEmpty) {
            return const NoTaskMessage();
          } else {
            return ListView.builder(
              scrollDirection: SizeConfig.orientation == Orientation.portrait
                  ? Axis.vertical
                  : Axis.horizontal,
              itemBuilder: (context, index) {
                var task = _taskController.taskList[index];
                if(task.date == DateFormat.yMd().format(widget.selectedDate) || task.repeat == 'Daily') {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: ShowTask(
                      task: task,
                      index: index,
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
              itemCount: _taskController.taskList.length,
            );
          }
        },
      ),
    );
  }
}
