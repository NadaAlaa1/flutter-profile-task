import 'package:flutter/material.dart';
import 'package:flutter_profile_task/core/constants/app_colors.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const MenuItem({super.key, required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.salmon, size: 30),
      title: Text(title, style: const TextStyle(color: AppColors.black)),
      onTap: onTap,
    );
  }
}