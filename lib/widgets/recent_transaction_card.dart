import 'package:flutter/material.dart';


class RecentTransactionCard extends StatelessWidget {
  const RecentTransactionCard({super.key, this.index});
  final int? index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
        minVerticalPadding: 6,
        leading: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            // radius: 18,
            backgroundColor: Colors.orange.withOpacity(0.2),
            child: Icon(
              Icons.fastfood,
              color: Colors.orange,
              // size: 16
            ),
          )
          // Icon(Icons.fastfood)
        ]),
        title: Text("Moon Chicken", style: TextStyle(fontSize: size.height * 16/780),),
        visualDensity: VisualDensity(vertical: -4),
        subtitle: Text("Makanan"),
        trailing: Text(
          "- Rp. 10.000",
          style: TextStyle(color: Colors.red),
        ),
      );;
  }
}