import 'package:get/get.dart';
import 'appointment_service.dart';
import 'models/appointment_model.dart';

class AppointmentController extends GetxController {
  final AppointmentService service;
  
  AppointmentController(this.service);

  List<AppointmentModel> appointments = [];
  bool loading = false;
  String? error;

  Future<void> fetchByDate(DateTime date) async {
    try {
      loading = true;
      error = null;
      update(['appointments']);
      
      appointments = await service.getAppointmentsByDate(date);
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false;
      update(['appointments']);
    }
  }
}
