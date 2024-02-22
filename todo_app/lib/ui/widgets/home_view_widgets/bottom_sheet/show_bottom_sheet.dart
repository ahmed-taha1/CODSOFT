import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/helpers/size_config.dart';
import 'package:todo_app/helpers/spacing.dart';
import 'package:todo_app/logic/controllers/task_controller.dart';
import 'package:todo_app/theming/theme.dart';
import 'package:todo_app/ui/widgets/home_view_widgets/bottom_sheet/bottom_sheet_option.dart';

import '../../../../data/models/task.dart';

ShowBottomSheet(BuildContext context, Task task) {
  final TaskController _taskController = Get.put(TaskController());

  Get.bottomSheet(SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.only(top: 4),
      width: SizeConfig.screenWidth,
      height: (SizeConfig.orientation == Orientation.landscape)
          ? (task.isCompleted == 1
              ? SizeConfig.screenHeight * 0.6
              : SizeConfig.screenHeight * 0.8)
          : (task.isCompleted == 1
              ? SizeConfig.screenHeight * 0.30
              : SizeConfig.screenHeight * 0.39),
      color: Get.isDarkMode ? darkHeaderClr : Colors.white,
      child: Column(
        children: [
          Flexible(
            child: Container(
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300],
              ),
            ),
          ),
          verticalSpace(20),
          task.isCompleted == 1
              ? Container()
              : BottomSheetOption(
                  label: 'Task Completed',
                  onTap: () {
                    if (task.id != null) {
                      _taskController.taskCompleted(id: task.id!);
                    }
                    Get.back();
                  },
                  color: primaryClr),
          BottomSheetOption(
              label: 'delete Task',
              onTap: () {
                if (task.id != null) {
                  _taskController.deleteTask(id: task.id!);
                }
                Get.back();
              },
              color: primaryClr),
          Divider(color: Get.isDarkMode ? Colors.grey : darkGreyClr),
          BottomSheetOption(
            label: 'Cancel',
            onTap: () {
              Get.back();
            },
            color: primaryClr,
          ),
        ],
      ),
    ),
  ));
}
