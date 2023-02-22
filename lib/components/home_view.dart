import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';

mixin HomeView on StatelessWidget {
  Widget categoryCard(Size size) {
    return Container(
      height: size.height * 0.18,
      width: size.width * 0.3,
      child: Column(children: [
        SizedBox(
          height: 16,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.fastfood),
            SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                // color: kPrimaryColor,
                backgroundColor: kPrimaryColor.withOpacity(0.3),
                value: 1 / 5,
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Makanan",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          "Rp. 30.000",
          style: TextStyle(color: Colors.black.withOpacity(0.6)),
        ),
      ]),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 1),
                blurRadius: 5,
                color: Colors.grey.withOpacity(0.3)),
          ]),
    );
  }
}
