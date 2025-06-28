import 'package:flutter/material.dart';
import 'package:flutter_profile_task/core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final bool enabled;
  final Color fillColor;
  final double borderRadius;

  const CustomTextField({
    super.key,
    this.onChanged,
    this.controller,
    this.enabled = true,
    this.fillColor = AppColors.white,
    this.borderRadius = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        enabled: enabled,
        style: const TextStyle(color: AppColors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
        onChanged: onChanged,
      ),
    );
  }
}