import 'package:flutter/material.dart';
class DateBoxWidget extends StatelessWidget {
  const DateBoxWidget({
    super.key,
    required this.boxColor,
    required this.label,
    required this.calenderLabel,
  });
  final Color boxColor;
  final String label;
  final String calenderLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.18,
          height: MediaQuery.of(context).size.height * 0.08,

          decoration:  BoxDecoration(color:boxColor,borderRadius: BorderRadius.circular(10.0)),
          child:  Center(child: Text(label,style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900, color: Colors.white),)),
        ),
        SizedBox(height: 5.0),
        Text(calenderLabel,style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.grey)),
      ],
    );
  }
}