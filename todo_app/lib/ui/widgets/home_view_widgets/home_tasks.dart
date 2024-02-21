import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/helpers/size_config.dart';
import 'package:todo_app/logic/services/notification_services.dart';
import 'package:todo_app/ui/widgets/home_view_widgets/show_task.dart';
import 'package:todo_app/ui/widgets/home_view_widgets/task_tile.dart';
import '../../../data/models/task.dart';
import '../../../logic/controllers/task_controller.dart';
import 'no_task_message.dart';

class HomeTasks extends StatelessWidget {
  HomeTasks({super.key});

  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: SizeConfig.orientation == Orientation.portrait
            ? Axis.vertical
            : Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: ShowTask(
              task: _taskController.taskList[index],
              index: index,
            ),
          );
        },
        itemCount: _taskController.taskList.length,
      ),
    );
  }
// return ShowTask(
//   task: Task(
//     title: 'title',
//     startTime: '12:30 PM',
//     endTime: '5:00 PM',
//     color: 0,
//     note: 'note',
//     isCompleted: 0,
//     date: 'date',
//   ),
// );
// return Expanded(
//   child: NoTaskMessage(),
// child: Obx(
//     (){
//       if(/*_taskController.taskList.isEmpty*/true){
//         return const NoTaskMessage();
//       }
//       else{
//         return Container(height: 0,);
//       }
//     },
// ),
// );
}
