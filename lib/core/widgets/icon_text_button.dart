import 'package:flutter/material.dart';
import 'package:flutter_profile_task/core/constants/app_colors.dart';

class IconTextButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const IconTextButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.black, size: 35), // Increased icon size
            const SizedBox(height: 4),
            Text(
              text,
              style: const TextStyle(color: AppColors.black, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}