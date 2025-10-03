import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/api_client.dart';
import '../network/network_info.dart';
import '../../modules/appointment/appointment_service.dart';
import '../../modules/auth/auth_service.dart';
import '../../modules/auth/auth_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() async {
    final prefs = await SharedPreferences.getInstance();
    Get.put<SharedPreferences>(prefs, permanent: true);
    Get.put<Connectivity>(Connectivity(), permanent: true);

    // Core
    Get.put<ApiClient>(ApiClient(), permanent: true);
    Get.put<NetworkInfo>(NetworkInfoImpl(Get.find()), permanent: true);

    // Services
    Get.put<AppointmentService>(
      AppointmentService(Get.find(), Get.find()),
      permanent: true,
    );
    Get.put<AuthService>(
      AuthService(Get.find(), Get.find(), prefs),
      permanent: true,
    );
    
    // Auth Controller (global)
    Get.put<AuthController>(
      AuthController(Get.find<AuthService>()),
      permanent: true,
    );
  }
}
