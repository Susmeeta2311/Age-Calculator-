import 'package:flutter/material.dart';

class NextBirthdayRowItemWidget extends StatelessWidget {
  const NextBirthdayRowItemWidget({
    super.key,
    required this.calendernumber,
    required this.calenderlabel,

  });
  final String calendernumber;
  final String calenderlabel;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45.0,
          width: 45.0,
          margin: EdgeInsets.only(bottom: 5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Center(child: Text(calendernumber,style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w700),),),

        ),
        Text(calenderlabel,style: TextStyle(fontSize: 9.0,fontWeight: FontWeight.w700,color: Colors.black54),),
      ],
    );
  }
}
