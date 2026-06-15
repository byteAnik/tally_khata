import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';

class CollectionRateTrend extends StatelessWidget {
  final int filterIndex;

  const CollectionRateTrend({super.key, required this.filterIndex});

  @override
  Widget build(BuildContext context) {
    final List<List<String>> allTitles = [
      ['মার্চ', 'এপ্রি', 'মে'],
      ['ডিসে', 'জানু', 'ফেব্রু', 'মার্চ', 'এপ্রি', 'মে'],
      ['জুন', 'জুল', 'আগ', 'সেপ্টে', 'অক্টো', 'নভে', 'ডিসে', 'জানু', 'ফেব্রু', 'মার্চ', 'এপ্রি', 'মে'],
    ];

    final List<List<double>> allDataPoints = [
      [75, 76, 78],
      [68, 70, 72, 75, 76, 78],
      [60, 61, 62, 64, 65, 66, 68, 70, 72, 75, 76, 78],
    ];

    final titles = allTitles[filterIndex];
    final dataPoints = allDataPoints[filterIndex];

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "সংগ্রহ হারের ট্রেন্ড",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0F172A),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 16.w,
                    height: 3.h,
                    color: const Color(0xFF4ADE80),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    "% হার",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 24.h),
          SizedBox(
            height: 160.h,
            child: LineChart(
              LineChartData(
                minY: 55,
                maxY: 85,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 5,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: const Color(0xFFE2E8F0),
                    strokeWidth: 1,
                    dashArray: [4, 4],
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value.toInt() < 0 || value.toInt() >= titles.length) return const SizedBox.shrink();
                        
                        if (filterIndex == 2 && value.toInt() % 2 != 0) {
                          return const SizedBox.shrink();
                        }
                        
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            titles[value.toInt()],
                            style: TextStyle(
                              color: const Color(0xFF64748B),
                              fontSize: 12.sp,
                            ),
                          ),
                        );
                      },
                      interval: 1,
                      reservedSize: 30,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          "${value.toInt()}%",
                          style: TextStyle(
                            color: const Color(0xFF64748B),
                            fontSize: 12.sp,
                          ),
                        );
                      },
                      interval: 5,
                      reservedSize: 40,
                    ),
                  ),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(dataPoints.length, (index) {
                      return FlSpot(index.toDouble(), dataPoints[index]);
                    }),
                    isCurved: false,
                    color: const Color(0xFF4ADE80),
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 4,
                          color: const Color(0xFF4ADE80),
                          strokeWidth: 0,
                        );
                      },
                    ),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

