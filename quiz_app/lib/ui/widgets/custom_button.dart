import 'package:flutter/material.dart';
import 'package:quiz_app/core/theming/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  const CustomButton({super.key, required this.text, required this.onPressed, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding:
        const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        backgroundColor: const Color.fromARGB(255, 79, 39, 179),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        text,
        style: textStyle ?? font17WhiteBold,
        textAlign: TextAlign.center,
      ),
    );
  }
}
