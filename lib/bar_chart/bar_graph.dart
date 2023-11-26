import 'package:dusecatask/bar_chart/bar_chart_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBarChart extends StatelessWidget {
  final List<double> weeklySummary;

  const MyBarChart({super.key, required this.weeklySummary});

  @override
  Widget build(BuildContext context) {
    //lets initialize the bar data
    BarData myBarData = BarData(
      satEarning: weeklySummary[0],
      sunEarning: weeklySummary[1],
      monEarning: weeklySummary[2],
      tueEarning: weeklySummary[3],
      wedEarning: weeklySummary[4],
      thuEarning: weeklySummary[5],
      friEarning: weeklySummary[6],
    );
    myBarData.initBarData();
    return BarChart(
      BarChartData(
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            fitInsideVertically: false,
            tooltipRoundedRadius: 16.r,
            tooltipBgColor: Colors.red,
            tooltipBorder: BorderSide(
              color: Colors.white,
              width: 1.w,
            ),
            tooltipPadding: EdgeInsets.symmetric(
              vertical: 2.h,
              horizontal: 16.w,
            ),
            tooltipMargin: 8.w,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '${rod.fromY}\$',
                TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                ),
              );
            },
          ),
        ),
        alignment: BarChartAlignment.spaceAround,
        groupsSpace: 29.68.w,
        maxY: 300,
        minY: 0,
        gridData: FlGridData(
          show: false,
        ),
        borderData: FlBorderData(
          show: false,
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(sideTitles: _bottomTitles),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                barsSpace: 29.68.w,
                x: data.x,
                barRods: [
                  BarChartRodData(
                    width: 10.65.w,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xffE92928),
                        const Color(0xffF54242).withOpacity(0.45),
                      ],
                    ),
                    toY: data.y,
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 25.h,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 1:
              text = 'Sat';
              break;
            case 2:
              text = 'Sun';
              break;
            case 3:
              text = 'Mon';
              break;
            case 4:
              text = 'Tue';
              break;
            case 5:
              text = 'Wed';
              break;
            case 6:
              text = 'Thu';
              break;
            case 7:
              text = 'Fri';
              break;
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xffB0BBD5)),
            ),
          );
        },
      );
}
