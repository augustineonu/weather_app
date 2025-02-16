import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HourlyForecastGraph extends StatelessWidget {
  final List<Map<String, dynamic>> hourlyData;

  const HourlyForecastGraph({Key? key, required this.hourlyData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(0),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
                drawBelowEverything: true,
                sideTitles: SideTitles(
                  getTitlesWidget: (value, meta) {
                    final hour = value.toInt();
                    return Text(
                      '${hour % 24}:00',
                      style: const TextStyle(color: Colors.white),
                    );
                  },
                )),
            leftTitles: AxisTitles(sideTitles: SideTitles()),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: hourlyData.asMap().entries.map((entry) {
                return FlSpot(
                  entry.key.toDouble(),
                  double.parse(entry.value['temp_c'].toString()),
                );
              }).toList(),
              isCurved: true,
              preventCurveOverShooting: true,
              color: Colors.white,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: true),
            ),
          ],
        ),
      ),
    );
  }
}
