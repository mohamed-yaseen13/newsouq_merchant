import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/constants/app_constants.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';
import 'dart:math';
import 'package:newsouq_merchant/features/home/presentation/widgets/metric_drop_down_menu.dart';
import 'package:newsouq_merchant/features/home/presentation/widgets/period_drop_down_menu.dart';
import 'package:newsouq_merchant/features/home/presentation/widgets/summary_chart.dart';

class SummaryContainer extends StatefulWidget {
  const SummaryContainer({super.key});

  @override
  State<SummaryContainer> createState() => _SummaryContainerState();
}

class _SummaryContainerState extends State<SummaryContainer> {
  String selectedMetric = 'Sales';
  String selectedPeriod = 'Last 7 Days';

  List<ChartData> getCurrentData() {
    return AppConstants.databaseData[selectedMetric]?[selectedPeriod] ?? [];
  }

  double getMaxValue() {
    final data = getCurrentData();
    if (data.isEmpty) return 100000;
    final maxVal = data.map((e) => e.value).reduce(max);
    // Round up to nearest 20k
    return ((maxVal / 20000).ceil() * 20000).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    final chartData = getCurrentData();
    final maxValue = getMaxValue();

    return Container(
      height: 590,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Summary',
                  style: AppTextStyles.black6ColorParagraph1Medium,
                ),
                horizontalSpace(12),
                MetricDropDownMenu(
                  selectedMetric: selectedMetric,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedMetric = newValue!;
                    });
                  },
                ),
                Spacer(),
                PeriodDropDownMenu(
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedPeriod = newValue!;
                    });
                  },
                  selectedPeriod: selectedPeriod,
                ),
              ],
            ),
            verticalSpace(24),
            SummaryChart(maxValue: maxValue, chartData: chartData),
          ],
        ),
      ),
    );
  }
}
