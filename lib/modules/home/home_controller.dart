import 'package:get/get.dart';
import '../appointment/appointment_service.dart';
import '../appointment/models/appointment_model.dart';

class HomeController extends GetxController {
  final AppointmentService appointmentService;
  
  HomeController(this.appointmentService);

  DateTime selectedDate = DateTime.now();
  List<AppointmentModel> appointments = [];
  bool loading = false;
  String? error;

  int get confirmedCount =>
      appointments.where((a) => a.status == 'confirmed').length;
  
  int get pendingCount =>
      appointments.where((a) => a.status == 'pending').length;

  Future<void> loadAppointments(DateTime date) async {
    try {
      loading = true;
      error = null;
      update(['home']);
      
      appointments = await appointmentService.getAppointmentsByDate(date);
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false;
      update(['home']);
    }
  }

  void selectDate(DateTime date) {
    selectedDate = date;
    loadAppointments(date);
  }

  void nextDay() {
    selectedDate = selectedDate.add(const Duration(days: 1));
    loadAppointments(selectedDate);
  }

  void previousDay() {
    selectedDate = selectedDate.subtract(const Duration(days: 1));
    loadAppointments(selectedDate);
  }
}
