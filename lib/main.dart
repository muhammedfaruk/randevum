import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/config/theme/app_theme.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';
import 'core/di/app_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const RandevumApp());
}

class RandevumApp extends StatelessWidget {
  const RandevumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'eRandevu',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: AppBindings(),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
      defaultTransition: Transition.cupertino,
    );
  }
}
