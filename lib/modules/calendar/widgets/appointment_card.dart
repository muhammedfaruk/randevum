import 'package:flutter/material.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../core/config/theme/app_radii.dart';

final class AppointmentCard extends StatelessWidget {
  final Map<String, dynamic> appointment;
  final VoidCallback? onTap;

  const AppointmentCard({
    super.key,
    required this.appointment,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final status = appointment['status'] ?? 'Bekliyor';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.circular(AppRadii.lg),
        border: Border.all(
          color: AppColors.divider,
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppRadii.lg),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                // Sol taraf - Saat kutusu (koyu gradient)
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF334155), // slate-700
                        Color(0xFF1e293b), // slate-800
                      ],
                    ),
                    borderRadius: BorderRadius.circular(AppRadii.lg),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 16,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _getHour(appointment['time']),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _getMinute(appointment['time']),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFcbd5e1), // slate-300
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),

                // Orta - Bilgiler
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointment['customerName'] ?? 'Müşteri',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        appointment['service'] ?? 'Hizmet',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF94a3b8), // slate-400
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),
                      // Durum Badge (subtle design)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _getStatusBgColor(status),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: _getStatusBorderColor(status),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: _getStatusDotColor(status),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              status,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: _getStatusTextColor(status),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),

                // Sağ taraf - Avatar (subtle design)
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF334155), // slate-700
                        Color(0xFF1e293b), // slate-800
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0x80475569), // slate-600 %50
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Color(0xFF94a3b8), // slate-400
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getHour(String? time) {
    if (time == null) return '00';
    final parts = time.split(':');
    return parts.isNotEmpty ? parts[0] : '00';
  }

  String _getMinute(String? time) {
    if (time == null) return '00';
    final parts = time.split(':');
    return parts.length > 1 ? parts[1] : '00';
  }

  Color _getStatusBgColor(String status) {
    switch (status) {
      case 'Tamamlandı':
        return const Color(0x80475569); // slate-600 %50
      case 'İptal':
        return const Color(0x80334155); // slate-700 %50
      case 'Bekliyor':
      default:
        return const Color(0x80334155); // slate-700 %50
    }
  }

  Color _getStatusBorderColor(String status) {
    switch (status) {
      case 'Tamamlandı':
        return const Color(0x8064748b); // slate-500 %50
      case 'İptal':
        return const Color(0x80475569); // slate-600 %50
      case 'Bekliyor':
      default:
        return const Color(0x80475569); // slate-600 %50
    }
  }

  Color _getStatusDotColor(String status) {
    switch (status) {
      case 'Tamamlandı':
        return const Color(0xFFcbd5e1); // slate-300
      case 'İptal':
        return const Color(0xFF94a3b8); // slate-400
      case 'Bekliyor':
      default:
        return const Color(0xFF94a3b8); // slate-400
    }
  }

  Color _getStatusTextColor(String status) {
    switch (status) {
      case 'Tamamlandı':
        return const Color(0xFFe2e8f0); // slate-200
      case 'İptal':
        return const Color(0xFFcbd5e1); // slate-300
      case 'Bekliyor':
      default:
        return const Color(0xFFcbd5e1); // slate-300
    }
  }
}
