import '../../core/api/api_client.dart';
import '../../core/api/api_endpoints.dart';
import '../../core/error/exceptions.dart';
import '../../core/network/network_info.dart';
import 'models/appointment_model.dart';

class AppointmentService {
  final ApiClient api;
  final NetworkInfo network;
  final bool useMockData = true; // Production'da false yap

  AppointmentService(this.api, this.network);

  // Get appointments by date
  Future<List<AppointmentModel>> getAppointmentsByDate(DateTime date) async {
    if (useMockData) {
      await Future.delayed(const Duration(milliseconds: 800));
      return _getMockAppointmentsByDate(date);
    }

    if (!await network.isConnected) {
      throw NetworkException('No internet connection');
    }

    try {
      final res = await api.get(
        ApiEndpoints.appointmentsByDate,
        queryParameters: {
          'date': date.toIso8601String().split('T')[0],
        },
      );

      if (res.statusCode == 200) {
        final List data = res.data;
        return data.map((e) => AppointmentModel.fromJson(e)).toList();
      }
      throw ServerException('Failed to fetch appointments');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  List<AppointmentModel> _getMockAppointmentsByDate(DateTime date) {
    final now = DateTime.now();
    final isToday = date.year == now.year && date.month == now.month && date.day == now.day;

    if (!isToday) {
      // Başka günler için daha az randevu
      return [
        AppointmentModel(
          id: 2001,
          branchId: 1,
          serviceId: 1,
          staffId: 1,
          guestFirstName: 'Mehmet',
          guestLastName: 'Demir',
          guestEmail: 'mehmet@example.com',
          guestPhone: '+90 555 234 5678',
          status: 'confirmed',
          confirmationCode: 'RDV2001',
          notes: null,
          startTime: '10:00',
          endTime: '10:30',
        ),
        AppointmentModel(
          id: 2002,
          branchId: 1,
          serviceId: 2,
          staffId: 1,
          guestFirstName: 'Ayşe',
          guestLastName: 'Kaya',
          guestEmail: 'ayse@example.com',
          guestPhone: '+90 555 345 6789',
          status: 'pending',
          confirmationCode: 'RDV2002',
          notes: 'Saç boyası yapılacak',
          startTime: '14:00',
          endTime: '15:00',
        ),
      ];
    }

    // Bugün için daha fazla randevu
    return [
      AppointmentModel(
        id: 1001,
        branchId: 1,
        serviceId: 1,
        staffId: 1,
        guestFirstName: 'Ahmet',
        guestLastName: 'Yılmaz',
        guestEmail: 'ahmet@example.com',
        guestPhone: '+90 555 123 4567',
        status: 'confirmed',
        confirmationCode: 'RDV1001',
        notes: 'Sakal tıraşı da yapılacak',
        startTime: '09:00',
        endTime: '09:30',
      ),
      AppointmentModel(
        id: 1002,
        branchId: 1,
        serviceId: 2,
        staffId: 1,
        guestFirstName: 'Mehmet',
        guestLastName: 'Demir',
        guestEmail: 'mehmet@example.com',
        guestPhone: '+90 555 234 5678',
        status: 'confirmed',
        confirmationCode: 'RDV1002',
        notes: null,
        startTime: '10:00',
        endTime: '10:45',
      ),
      AppointmentModel(
        id: 1003,
        branchId: 1,
        serviceId: 1,
        staffId: 1,
        guestFirstName: 'Ayşe',
        guestLastName: 'Kaya',
        guestEmail: 'ayse@example.com',
        guestPhone: '+90 555 345 6789',
        status: 'pending',
        confirmationCode: 'RDV1003',
        notes: 'İlk kez geliyor',
        startTime: '11:00',
        endTime: '11:30',
      ),
      AppointmentModel(
        id: 1004,
        branchId: 1,
        serviceId: 3,
        staffId: 1,
        guestFirstName: 'Fatma',
        guestLastName: 'Şahin',
        guestEmail: 'fatma@example.com',
        guestPhone: '+90 555 456 7890',
        status: 'confirmed',
        confirmationCode: 'RDV1004',
        notes: 'Özel gün hazırlığı',
        startTime: '14:00',
        endTime: '15:00',
      ),
      AppointmentModel(
        id: 1005,
        branchId: 1,
        serviceId: 1,
        staffId: 1,
        guestFirstName: 'Ali',
        guestLastName: 'Çelik',
        guestEmail: 'ali@example.com',
        guestPhone: '+90 555 567 8901',
        status: 'confirmed',
        confirmationCode: 'RDV1005',
        notes: null,
        startTime: '15:30',
        endTime: '16:00',
      ),
      AppointmentModel(
        id: 1006,
        branchId: 1,
        serviceId: 2,
        staffId: 1,
        guestFirstName: 'Zeynep',
        guestLastName: 'Arslan',
        guestEmail: 'zeynep@example.com',
        guestPhone: '+90 555 678 9012',
        status: 'pending',
        confirmationCode: 'RDV1006',
        notes: 'Renk değişikliği isteniyor',
        startTime: '16:30',
        endTime: '17:30',
      ),
    ];
  }
}
