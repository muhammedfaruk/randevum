import 'package:flutter/material.dart';
import 'package:randevum/core/config/theme/app_colors.dart';

final class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(height: 0, color: AppColors.gray500,);
  }
}