import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Trends extends StatefulWidget {
  const Trends({Key? key}) : super(key: key);

  @override
  State<Trends> createState() => _TrendsState();
}

class _TrendsState extends State<Trends> {
  List sampleData = [
    SampleData(date: DateTime(2022, 03, 11), rate: 2),
    SampleData(date: DateTime(2022, 03, 12), rate: 5),
    SampleData(date: DateTime(2022, 03, 13), rate: 3),
    SampleData(date: DateTime(2022, 03, 14), rate: 7),
  ];
  Widget build(BuildContext context) {
    return Container(
        child: LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
              spots: sampleData
                  .map((element) =>
                      FlSpot(element.rate as double, element.rate as double))
                  .toList()),
        ],
      ),
    ));
  }
}

class SampleData {
  final DateTime date;
  final double rate;

  SampleData({required this.date, required this.rate});
}
