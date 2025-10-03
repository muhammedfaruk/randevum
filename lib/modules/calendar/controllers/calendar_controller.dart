import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarController extends GetxController {
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.twoWeeks;
  
  // Mock randevu verileri
  Map<DateTime, List<Map<String, dynamic>>> appointments = <DateTime, List<Map<String, dynamic>>>{};
  List<Map<String, dynamic>> selectedDayAppointments = <Map<String, dynamic>>[];

  @override
  void onInit() {
    super.onInit();
    _loadMockAppointments();
    _updateSelectedDayAppointments();
  }

  void _loadMockAppointments() {
    final today = DateTime.now();
    final tomorrow = today.add(const Duration(days: 1));
    final dayAfterTomorrow = today.add(const Duration(days: 2));

    appointments = {
      DateTime(today.year, today.month, today.day): [
        {
          'customerName': 'Ahmet Yılmaz',
          'service': 'Saç Kesimi',
          'time': '09:00',
          'status': 'Bekliyor',
        },
        {
          'customerName': 'Ayşe Demir',
          'service': 'Makyaj',
          'time': '11:30',
          'status': 'Tamamlandı',
        },
      ],
      DateTime(tomorrow.year, tomorrow.month, tomorrow.day): [
        {
          'customerName': 'Mehmet Kaya',
          'service': 'Sakal Tıraşı',
          'time': '14:00',
          'status': 'Bekliyor',
        },
      ],
      DateTime(dayAfterTomorrow.year, dayAfterTomorrow.month, dayAfterTomorrow.day): [
        {
          'customerName': 'Fatma Özkan',
          'service': 'Saç Boyama',
          'time': '10:00',
          'status': 'Bekliyor',
        },
        {
          'customerName': 'Ali Çelik',
          'service': 'Saç Kesimi',
          'time': '15:30',
          'status': 'İptal',
        },
      ],
    };
  }

  List<Map<String, dynamic>> getEventsForDay(DateTime day) {
    final normalizedDay = DateTime(day.year, day.month, day.day);
    return appointments[normalizedDay] ?? [];
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay = selectedDay;
    this.focusedDay = focusedDay;
    _updateSelectedDayAppointments();
    update();
  }

  void onFormatChanged(CalendarFormat format) {
    calendarFormat = format;
    update();
  }

  void onPageChanged(DateTime focusedDay) {
    this.focusedDay = focusedDay;
    update();
  }

  void _updateSelectedDayAppointments() {
    final normalizedDay = DateTime(
      selectedDay.year,
      selectedDay.month,
      selectedDay.day,
    );
    selectedDayAppointments = appointments[normalizedDay] ?? [];
    update(['date-header', 'appointments-list']);
  }

  String getFormattedDate() {
    // Türkçe ay isimleri için manuel mapping
    final months = [
      'Ocak', 'Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran',
      'Temmuz', 'Ağustos', 'Eylül', 'Ekim', 'Kasım', 'Aralık'
    ];
    
    return '${selectedDay.day} ${months[selectedDay.month - 1]} ${selectedDay.year}';
  }

  void addNewAppointment() {
    // Yeni randevu ekleme işlemi
    Get.snackbar(
      'Bilgi',
      'Yeni randevu ekleme özelliği yakında eklenecek',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}