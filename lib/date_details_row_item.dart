import 'package:flutter/material.dart';
class DateDetailsRowItem extends StatelessWidget {
  const DateDetailsRowItem({
    super.key,
    required this.label1,
    required this.numbers,


  });
  final String label1;
  final String numbers;




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label1,style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),),
          Text(numbers,style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),),
        ],

      ),
    );
  }
}