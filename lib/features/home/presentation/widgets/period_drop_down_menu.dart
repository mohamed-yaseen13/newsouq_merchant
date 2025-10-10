import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/constants/app_constants.dart';

class PeriodDropDownMenu extends StatelessWidget {
  final String selectedPeriod;
  final ValueChanged<String?>? onChanged;

  const PeriodDropDownMenu({
    super.key,
    required this.onChanged,
    required this.selectedPeriod,
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
        value: selectedPeriod,
        underline: const SizedBox(),
        icon: const Icon(Icons.keyboard_arrow_down),
        style: const TextStyle(color: Colors.black87, fontSize: 14),
        items: AppConstants.periods.map((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
