import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.18,
      width: size.width * 0.3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 1),
                blurRadius: 5,
                color: Colors.grey.withOpacity(0.3)),
          ]),
      child: Column(children: [
        SizedBox(
          height: size.height * 16 / 780,
        ),
        CircularPercentIndicator(
          radius: size.height * 30/780,
          lineWidth: 5.0,
          percent: 0.5,
          center: Text("100%", style: TextStyle(fontSize: size.height * 14/780),),
          animation: true,
          progressColor: kPrimaryColor,
        ),
        SizedBox(
          height: size.height * 14 / 780,
        ),
        Text(
          "Makanan",
          style: TextStyle(fontSize: size.height * 16 / 780),
        ),
        SizedBox(
          height: size.height * 4 / 780,
        ),
        Text(
          "Rp. 30.000",
          style: TextStyle(fontSize: size.height * 14 / 780, color: Colors.black.withOpacity(0.6)),
        ),
      ]),
    );
  }
}
