import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<PieChartSectionData> dataPie() {
    return [
      PieChartSectionData(
        value: 80,
        title: '80%',
        radius: 50,
        color: Colors.orange,
        titleStyle: TextStyle(
          fontSize: 14,
          // fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
        ),
      ),
      PieChartSectionData(
        value: 10,
        title: '10%',
        radius: 50,
        color: Colors.blueAccent,
        titleStyle: TextStyle(
          fontSize: 14,
          // fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
        ),
      ),
      PieChartSectionData(
        value: 10,
        title: '10%',
        radius: 50,
        color: Colors.pink,
        titleStyle: TextStyle(
          fontSize: 14,
          // fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child:Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 24,),
        SizedBox(
          height: 200,
          child: PieChart(PieChartData(
              borderData: FlBorderData(show: false),
              centerSpaceRadius: 40,
              sectionsSpace: 0,
              sections: dataPie())),
        ),
      ]),
    ));
  }
}
