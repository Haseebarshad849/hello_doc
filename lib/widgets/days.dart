// import 'package:flutter/material.dart';
//
// class Days extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Container(
//           padding: EdgeInsets.all(16),
//           child: Text(
//             day,
//             // _daysOfWeek[i].day,
//             style: Theme.of(context)
//                 .textTheme
//                 .headline6
//                 .copyWith(fontStyle: FontStyle.normal),
//           ),
//         ),
//         Row(
//           children: [
//             TimeFieldWidget(
//               initialValue: '',
//               labelText: 'From',
//               onChanged: (val) {
//                 print(val);
//                 setState(() {
//                   list[index].from = val;
//                   // _daysOfWeek[i].from = val;
//                 });
//               },
//             ),
//             Text(
//               '-',
//               style: Theme.of(context).textTheme.headline6,
//             ),
//             TimeFieldWidget(
//               labelText: 'To',
//               onChanged: (val) {
//                 setState(() {
//                   list[index].end = val;
//                   // _daysOfWeek[i].end = val;
//                 });
//               },
//             ),
//           ],
//         ),
//       ],
//     );;
//   }
// }
//
//
// // Widget days({String day, int index, List<TimingModel> list}) {
// //   return
// // }