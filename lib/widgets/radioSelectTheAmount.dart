// import 'package:flutter/material.dart';
//
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
//
// class RadioSelectTheAmount extends StatefulWidget {
//   final String myImageAdd;
//   final String myText;
//   final Size mySize;
//   dynamic groupValue;
//   final dynamic myValue;
//
//   RadioSelectTheAmount(
//       {this.myImageAdd,
//       this.myText,
//       this.mySize,
//       this.groupValue,
//       this.myValue});
//
//   @override
//   _RadioSelectTheAmountState createState() => _RadioSelectTheAmountState();
// }
//
// class _RadioSelectTheAmountState extends State<RadioSelectTheAmount> {
//   @override
//   Widget build(BuildContext context) {
//     return NeumorphicRadio(
//       groupValue: widget.groupValue,
//       value: widget.myValue,
//       onChanged: (val) {
//         print(val);
//         setState(() {
//           widget.groupValue = widget.myValue;
//         });
//       },
//       child: Container(
//         width: widget.mySize.width * 0.25,
//         padding: EdgeInsets.all(5),
//         margin: EdgeInsets.all(5),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Image.asset(
//               widget.myImageAdd,
//               height: 60,
//               width: 60,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Text(
//                 widget.myText,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
