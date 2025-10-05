import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../core/config/theme/app_spacing.dart';
import '../../../core/routes/app_routes.dart';
import '../../auth/auth_controller.dart';
import '../home_controller.dart';

final class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<HomeController>();
    controller.loadAppointments(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: GetBuilder<HomeController>(
            id: 'home',
            builder: (controller) {
              return Column(
                children: [
                  // AppBar
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.s4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Randevularım',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.logout, color: AppColors.textPrimary),
                          onPressed: () async {
                            await authController.logout();
                            Get.offAllNamed(AppRoutes.login);
                          },
                        ),
                      ],
                    ),
                  ),

                  // User Info Card
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: AppSpacing.s4),
                    padding: const EdgeInsets.all(AppSpacing.s4),
                    decoration: BoxDecoration(
                      gradient: AppColors.cardGradient,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.divider),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hoş geldiniz,',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.s1),
                        Text(
                          authController.currentUser?.name ?? 'Kullanıcı',
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Date Selector
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.s4),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.chevron_left),
                          onPressed: () {
                            controller.previousDay();
                          },
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              final date = await showDatePicker(
                                context: context,
                                initialDate: controller.selectedDate,
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2030),
                              );
                              if (date != null) {
                                controller.selectDate(date);
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: AppSpacing.s3,
                              ),
                              decoration: BoxDecoration(
                                gradient: AppColors.cardGradient,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppColors.divider,
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    DateFormat('dd/MM/yyyy').format(controller.selectedDate),
                                    style: const TextStyle(
                                      color: AppColors.textPrimary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    _getDayName(controller.selectedDate.weekday),
                                    style: const TextStyle(
                                      color: AppColors.textSecondary,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.chevron_right),
                          onPressed: () {
                            controller.nextDay();
                          },
                        ),
                      ],
                    ),
                  ),

                  // Stats
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s4),
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildStatCard(
                            'Toplam',
                            controller.appointments.length.toString(),
                            AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.s2),
                        Expanded(
                          child: _buildStatCard(
                            'Onaylı',
                            controller.confirmedCount.toString(),
                            AppColors.success,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.s2),
                        Expanded(
                          child: _buildStatCard(
                            'Bekleyen',
                            controller.pendingCount.toString(),
                            AppColors.warning,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.s4),

                  // Appointments List
                  Expanded(
                    child: controller.loading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          )
                        : controller.error != null
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.error_outline,
                                      size: 64,
                                      color: AppColors.error,
                                    ),
                                    const SizedBox(height: AppSpacing.s4),
                                    Text(
                                      controller.error!,
                                      style: const TextStyle(
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                    const SizedBox(height: AppSpacing.s4),
                                    ElevatedButton(
                                      onPressed: () {
                                        controller.loadAppointments(
                                          controller.selectedDate,
                                        );
                                      },
                                      child: const Text('Tekrar Dene'),
                                    ),
                                  ],
                                ),
                              )
                            : controller.appointments.isEmpty
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.event_busy,
                                          size: 64,
                                          color: AppColors.gray400,
                                        ),
                                        const SizedBox(height: AppSpacing.s4),
                                        Text(
                                          'Bu tarihte randevu yok',
                                          style: TextStyle(
                                            color: AppColors.textSecondary,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : ListView.builder(
                                    padding: const EdgeInsets.all(AppSpacing.s4),
                                    itemCount: controller.appointments.length,
                                    itemBuilder: (context, index) {
                                      final appointment = controller.appointments[index];
                                      return _buildAppointmentCard(appointment);
                                    },
                                  ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.s3),
      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider, width: 1),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  String _getDayName(int weekday) {
    const days = ['Pazartesi', 'Salı', 'Çarşamba', 'Perşembe', 'Cuma', 'Cumartesi', 'Pazar'];
    return days[weekday - 1];
  }

  Widget _buildAppointmentCard(appointment) {
    final statusBgColor = appointment.status == 'confirmed'
        ? AppColors.successBg
        : appointment.status == 'pending'
            ? AppColors.warningBg
            : AppColors.error.withValues(alpha: 0.2);

    final statusTextColor = appointment.status == 'confirmed'
        ? AppColors.successText
        : appointment.status == 'pending'
            ? AppColors.warningText
            : AppColors.error;

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.s3),
      padding: const EdgeInsets.all(AppSpacing.s4),
      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.divider,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: statusBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  appointment.status == 'confirmed'
                      ? 'Onaylı'
                      : appointment.status == 'pending'
                          ? 'Bekliyor'
                          : 'İptal',
                  style: TextStyle(
                    color: statusTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                '${appointment.startTime} - ${appointment.endTime}',
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.s3),
          Text(
            '${appointment.guestFirstName} ${appointment.guestLastName}',
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.s2),
          Row(
            children: [
              const Icon(Icons.phone, size: 16, color: AppColors.textSecondary),
              const SizedBox(width: AppSpacing.s2),
              Text(
                appointment.guestPhone,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          if (appointment.notes != null) ...[
            const SizedBox(height: AppSpacing.s2),
            Row(
              children: [
                const Icon(Icons.note, size: 16, color: AppColors.textSecondary),
                const SizedBox(width: AppSpacing.s2),
                Expanded(
                  child: Text(
                    appointment.notes!,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
