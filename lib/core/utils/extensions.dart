import 'package:flutter/material.dart';

extension ColorExtension on String {
  Color toColor() {
    final hexColor = replaceAll('#', '');
    return Color(int.parse('FF$hexColor', radix: 16));
  }
}

extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  
  bool get isMobile => width < 640;
  bool get isTablet => width >= 640 && width < 1024;
  bool get isDesktop => width >= 1024;
}
