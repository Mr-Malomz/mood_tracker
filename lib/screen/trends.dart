import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/mood_service.dart';
import 'package:mood_tracker/utils.dart';

class Trends extends StatefulWidget {
  const Trends({Key? key}) : super(key: key);

  @override
  State<Trends> createState() => _TrendsState();
}

class _TrendsState extends State<Trends> {
  late List<Mood> moods;
  bool _isLoading = false;
  bool _isError = false;

  @override
  void initState() {
    _getMoodList();
    super.initState();
  }

  _getMoodList() {
    setState(() {
      _isLoading = true;
    });

    MoodService().getMoodList().then((value) {
      setState(() {
        moods = value;
        _isLoading = false;
      });
    }).catchError((e) {
      setState(() {
        _isLoading = false;
        _isError = true;
      });
    });
  }

  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.blue,
          ))
        : _isError
            ? const Center(
                child: Text(
                  'Error getting list of transactions',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : Padding(
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
                        spots: moods
                            .asMap()
                            .map((key, value) => MapEntry(key,
                                FlSpot(key.toDouble(), value.rate.toDouble())))
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
