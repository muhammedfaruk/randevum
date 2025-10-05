import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors (Sky Blue)
  static const primary = Color(0xFF80B0F8);
  static const primaryLight = Color(0xFFA8C8F8);
  static const primaryDark = Color(0xFF405880);
  
  // Background Colors (Slate Dark)
  static const background = Color(0xFF0f172a); // slate-900
  static const backgroundAlt = Color(0xFF1e293b); // slate-800
  static const surface = Color(0xCC1e293b); // slate-800 %80 opacity
  static const surfaceAlt = Color(0xCC0f172a); // slate-900 %80 opacity
  static const surfaceVariant = Color(0xFF182024);
  static const divider = Color(0x80334155); // slate-700 %50 opacity
  
  // Gradient Colors
  static const gradientBlue = Color(0xFF3b82f6); // blue-500
  static const gradientPurple = Color(0xFF9333ea); // purple-600
  
  // Status Badge Colors
  static const warningBg = Color(0x33F59E0B); // amber-500 %20 opacity
  static const warningText = Color(0xFFFBBF24); // amber-400
  static const successBg = Color(0x3310B981); // emerald-500 %20 opacity
  static const successText = Color(0xFF34D399); // emerald-400
  
  // Text Colors (Light on Dark)
  static const textPrimary = Color(0xFFF8F8F8);
  static const textSecondary = Color(0xFFA0A7AF);
  static const textDisabled = Color(0xFF6B737C);
  static const link = Color(0xFF80B0F8);
  
  // Status Colors (Legacy - use badge colors for new components)
  static const success = Color(0xFF22C55E);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFEF4444);
  static const info = Color(0xFF80B0F8);
  
  // Gradient Definitions
  static const backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0f172a), // slate-900
      Color(0xFF1e293b), // slate-800
      Color(0xFF0f172a), // slate-900
    ],
    stops: [0.0, 0.5, 1.0],
  );
  
  static const cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xCC1e293b), // slate-800 %80 opacity
      Color(0xCC0f172a), // slate-900 %80 opacity
    ],
  );
  
  static const timeSlotGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF3b82f6), // blue-500
      Color(0xFF9333ea), // purple-600
    ],
  );
  
  // Gray Scale
  static const gray50 = Color(0xFFF9FAFB);
  static const gray100 = Color(0xFFF3F4F6);
  static const gray200 = Color(0xFFE5E7EB);
  static const gray300 = Color(0xFFD1D5DB);
  static const gray400 = Color(0xFF9CA3AF);
  static const gray500 = Color(0xFF6B7280);
  static const gray600 = Color(0xFF4B5563);
  static const gray700 = Color(0xFF374151);
  static const gray800 = Color(0xFF1F2937);
  static const gray900 = Color(0xFF111827);
  
  // Utility
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
}
