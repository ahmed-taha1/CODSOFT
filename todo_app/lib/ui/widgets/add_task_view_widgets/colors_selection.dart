import 'package:flutter/material.dart';
import 'package:todo_app/helpers/spacing.dart';

import '../../theme.dart';

class ColorsSelection extends StatefulWidget {
  ColorsSelection({
    super.key, required this.selectedColor,
  });

  int selectedColor;

  @override
  State<ColorsSelection> createState() => _ColorsSelectionState();
}

class _ColorsSelectionState extends State<ColorsSelection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color', style: titleStyle),
        verticalSpace(8),
        Wrap(
          direction: Axis.horizontal,
          children: List<Widget>.generate(
            3,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  widget.selectedColor = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CircleAvatar(
                  backgroundColor: index == 0
                      ? primaryClr
                      : index == 1
                          ? pinkClr
                          : orangeClr,
                  radius: 14,
                  child: widget.selectedColor == index ? const Icon(
                    Icons.done,
                    size: 16,
                    color: Colors.white,
                  ) : null,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
