// import 'package:flutter/material.dart';
//
// class CustomDropDownMenu extends StatelessWidget {
//   const CustomDropDownMenu({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton(
//       dropdownColor: Colors.blueGrey,
//       borderRadius: BorderRadius.circular(10),
//       items: remindList
//           .map(
//             (e) => DropdownMenuItem(
//           value: e,
//           child: Text(
//             '$e',
//             style: const TextStyle(color: Colors.white),
//           ),
//         ),
//       )
//           .toList(),
//       icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
//       iconSize: 32,
//       elevation: 4,
//       style: subTitleStyle,
//       underline: Container(
//         height: 0,
//         color: Colors.white,
//       ),
//       onChanged: (value) {
//         setState(() {
//           _selectedRemind = value as int;
//         });
//       },
//     );
//   }
// }
