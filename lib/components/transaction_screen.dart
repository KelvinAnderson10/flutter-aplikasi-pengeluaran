import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> dates = ["Today", "22 Feb 2023", "22 Feb 2023", "22 Feb 2023"];
    List<String> transactions = ["Moon Chicken", "Sate Taichan", "Babi bakar"];
    Widget buildTransaction(String transaction){
      return Container(
        // margin: EdgeInsets.symmetric(vertical: 8),
        height: size.height * 0.07,
        width: size.width * 0.85,
        decoration: BoxDecoration(
          // color: Color(0xFFf1f1fa),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Container(
            width: 150,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(transaction, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0XFF456581)),),
              Text("14:35", style: TextStyle(fontSize: 12),)
            ],
          )),
          Text("- Rp. 10.000", style: TextStyle(color: Colors.red),)
        ]),
      );
    }

    Widget buildDate(String date) {
      // return ListTile(
      //   title: Text("22 Februari 2023"),
      // );
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date, style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 18),),
            SizedBox(height: 4,),
            Container(
          child: Column(
            children: [
              for (final item in transactions)
                buildTransaction(item)
            ],
          ),
        ),
          ],
        ),
        );
    }



    return Scaffold(
      body: Stack(children: [
        Container(
          child: Column(children: [Container(
            // padding: EdgeInsets.only(top: kDefaultPadding,),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
                primary: false,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
              itemCount: dates.length * 2,
              itemBuilder: ((context, i){
                if (i.isOdd) return const Divider();
                final index = i ~/ 2;
                return buildDate(dates[index]);
              })),
            height: size.height * 0.8,
            decoration: BoxDecoration(
                color: Colors.white,),
          )]),
        )
      ]),
    );
  }
}
