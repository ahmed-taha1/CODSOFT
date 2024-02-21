import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/helpers/size_config.dart';
import 'package:todo_app/theming/theme.dart';

class BottomSheetOption extends StatelessWidget {
  const BottomSheetOption(
      {super.key,
      required this.label,
      required this.onTap,
      required this.color,
      this.isClose = false});

  final String label;
  final Function() onTap;
  final Color color;
  final bool isClose;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 65,
        width: SizeConfig.screenWidth * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
              color: isClose
                  ? Get.isDarkMode
                      ? Colors.grey[600]!
                      : Colors.grey[300]!
                  : color,
              width: 2),
          borderRadius: BorderRadius.circular(20),
          color: isClose ? Colors.transparent : color,
        ),
        child: Center(
          child: Text(
            label,
            style:
                isClose ? titleStyle : titleStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
