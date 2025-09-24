import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/constants/app_constants.dart';

class CategoryDropdown extends StatelessWidget {
  final ValueChanged<String?>? onChanged;

  const CategoryDropdown({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: DropdownButtonFormField<String>(
        initialValue: null,
        onChanged: onChanged,
        validator: (value) {
          if (value == null) {
            return "Category is Required";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFDDDDDD)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFDDDDDD)),
          ),
        ),
        hint: Text(
          'Select Product Category',
          style: TextStyle(color: Colors.grey[600]),
        ),
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        items: AppConstants.categories.map((category) {
          return DropdownMenuItem(value: category, child: Text(category));
        }).toList(),
      ),
    );
  }
}
