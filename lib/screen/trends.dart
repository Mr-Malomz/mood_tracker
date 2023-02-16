import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Trends extends StatefulWidget {
  const Trends({Key? key}) : super(key: key);

  @override
  State<Trends> createState() => _TrendsState();
}

class _TrendsState extends State<Trends> {
  List<SampleData> sampleData = [
    SampleData(date: DateTime.now(), rate: 2),
    SampleData(date: DateTime.now(), rate: 5),
    SampleData(date: DateTime.now(), rate: 3),
    SampleData(date: DateTime.now(), rate: 7),
  ];
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30, right: 30),
      child: Container(
          child: LineChart(
        LineChartData(
          minY: 0,
          maxY: 10,
          minX: 0,
          maxX: 15,
          borderData: FlBorderData(
            show: true,
            border: Border.all(),
          ),
          titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: sampleData
                  .asMap()
                  .map((key, value) =>
                      MapEntry(key, FlSpot(key.toDouble(), value.rate)))
                  .values
                  .toList(),
              isCurved: true,
              color: Colors.blueAccent,
              barWidth: 2.5,
              belowBarData: BarAreaData(
                show: true,
                color: Color.fromARGB(99, 142, 152, 169),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class SampleData {
  final DateTime date;
  final double rate;

  SampleData({required this.date, required this.rate});
}
