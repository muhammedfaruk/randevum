import 'package:get/get.dart';
import '../../modules/auth/views/login_screen.dart';
import '../../modules/auth/auth_controller.dart';
import '../../modules/auth/auth_service.dart';
import '../../modules/home/views/home_screen.dart';
import '../../modules/home/home_controller.dart';
import '../../modules/appointment/appointment_service.dart';
import '../../presentation/views/splash/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: BindingsBuilder(() {
        Get.put(AuthController(Get.find<AuthService>()));
      }),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: BindingsBuilder(() {
        Get.put(HomeController(Get.find<AppointmentService>()));
      }),
    ),
  ];
}
