import 'package:get/get.dart';
import 'auth_service.dart';
import 'models/user_model.dart';

class AuthController extends GetxController {
  final AuthService service;
  
  AuthController(this.service);

  UserModel? currentUser;
  bool loading = false;
  String? error;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final isLoggedIn = await service.isLoggedIn();
    if (isLoggedIn) {
      currentUser = await service.getCurrentUser();
      update(['auth']);
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      loading = true;
      error = null;
      update(['auth']);
      
      currentUser = await service.login(email, password);
      
      loading = false;
      update(['auth']);
      return true;
    } catch (e) {
      error = e.toString();
      loading = false;
      update(['auth']);
      return false;
    }
  }

  Future<void> logout() async {
    await service.logout();
    currentUser = null;
    update(['auth']);
  }

  bool get isLoggedIn => currentUser != null;
}
