import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randevum/core/config/theme/app_colors.dart';
import 'package:randevum/core/config/theme/app_radii.dart';
import 'package:randevum/core/widgets/custom_divider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'calendar_controller.dart';

part 'widgets/appointment_card.dart';

final class CalendarView extends GetView<CalendarController> {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Takvim'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).textTheme.titleLarge?.color,
      ),
      body: Column(
        children: [
          // Takvim Widget'ı
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(AppRadii.sm),
            ),
            child: Column(
              children: [
                GetBuilder<CalendarController>(
                  builder: (controller) => TableCalendar(
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: controller.focusedDay,
                    selectedDayPredicate: (day) => isSameDay(controller.selectedDay, day),
                    calendarFormat: controller.calendarFormat,
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Ay',
                      CalendarFormat.twoWeeks: '2 Hafta',
                    },
                    onDaySelected: controller.onDaySelected,
                    onFormatChanged: controller.onFormatChanged,
                    onPageChanged: controller.onPageChanged,
                    calendarStyle: CalendarStyle(
                      outsideDaysVisible: false,
                      weekendTextStyle: TextStyle(color: AppColors.gray500),
                      holidayTextStyle: TextStyle(color: AppColors.error),
                      selectedDecoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withValues(alpha: 0.5),
                        shape: BoxShape.circle,
                      ),
                      markerDecoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      defaultTextStyle: TextStyle(
                        fontSize: 16,
                        color: AppColors.white,
                      ),
                    ),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      leftChevronIcon: Icon(Icons.chevron_left),
                      rightChevronIcon: Icon(Icons.chevron_right),
                    ),
                    eventLoader: controller.getEventsForDay,
                  ),
                ),

                // Kaydırılabilir alan göstergesi (takvim içinde)
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Seçili güne ait randevular
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<CalendarController>(
                    id: 'date-header',
                    builder: (controller) => Text(
                      'Randevular - ${controller.getFormattedDate()}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GetBuilder<CalendarController>(
                      id: 'appointments-list',
                      builder: (controller) => controller.selectedDayAppointments.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.event_busy,
                                    size: 64,
                                    color: Colors.grey[400],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Bu gün için randevu bulunmuyor',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : ListView.separated(
                              separatorBuilder: (context, index) => CustomDivider(),
                              padding: EdgeInsets.zero,
                              itemCount: controller.selectedDayAppointments.length,                              
                              itemBuilder: (context, index) {
                                final appointment = controller.selectedDayAppointments[index];
                                return AppointmentCard(appointment: appointment, statusColor: _getStatusColor(appointment['status']));
                              },
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.addNewAppointment,
        child: const Icon(Icons.add),
      ),
    );
  }

  Color _getStatusColor(String? status) {
    switch (status) {
      case 'Tamamlandı':
        return const Color(0xFF22C55E); // AppColors.success
      case 'İptal':
        return const Color(0xFFEF4444); // AppColors.error
      case 'Bekliyor':
      default:
        return const Color(0xFFF59E0B); // AppColors.warning
    }
  }
}
