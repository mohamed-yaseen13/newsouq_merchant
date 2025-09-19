import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';

class SummaryContainer extends StatelessWidget {
  const SummaryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 726,
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
                Spacer(),
                Text('This Week'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
