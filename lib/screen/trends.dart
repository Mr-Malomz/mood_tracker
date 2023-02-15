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
          titlesData: LineTitlesHelper.getTitleData(sampleData),
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

class LineTitlesHelper {
  static getTitleData(List<SampleData> data) => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            getTitlesWidget: (value, meta) {
              const style = TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
              );
              Widget text;
              switch (value.toInt()) {
                case 0:
                  text = Text('${data[0].date.hour}:${data[0].date.minute}',
                      style: style);
                  break;
                case 1:
                  text = Text('${data[1].date.hour}:${data[1].date.minute}',
                      style: style);
                  break;
                case 2:
                  text = Text('${data[2].date.hour}:${data[3].date.minute}',
                      style: style);
                  break;
                case 3:
                  text = Text('${data[3].date.hour}:${data[3].date.minute}',
                      style: style);
                  break;
                default:
                  text = Text('', style: style);
                  break;
              }

              return SideTitleWidget(
                axisSide: meta.axisSide,
                child: text,
              );
            },
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );
}
