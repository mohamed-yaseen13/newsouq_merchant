import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/constants/app_constants.dart';

class MetricDropDownMenu extends StatelessWidget {
  final String selectedMetric;
  final ValueChanged<String?>? onChanged;
  const MetricDropDownMenu({
    super.key,
    required this.selectedMetric,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: DropdownButton<String>(
        value: selectedMetric,
        underline: const SizedBox(),
        icon: const Icon(Icons.keyboard_arrow_down),
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        items: AppConstants.metrics.map((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
