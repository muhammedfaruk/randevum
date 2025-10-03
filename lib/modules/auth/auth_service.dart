import 'package:shared_preferences/shared_preferences.dart';
import '../../core/api/api_client.dart';
import '../../core/api/api_endpoints.dart';
import '../../core/error/exceptions.dart';
import '../../core/network/network_info.dart';
import 'models/user_model.dart';

class AuthService {
  final ApiClient api;
  final NetworkInfo network;
  final SharedPreferences prefs;
  final bool useMockData = true;
  
  AuthService(this.api, this.network, this.prefs);

  Future<UserModel> login(String email, String password) async {
    if (useMockData) {
      await Future.delayed(const Duration(seconds: 1));
      
      // Mock validation
      if (email.isEmpty || password.isEmpty) {
        throw ServerException('Email ve şifre gerekli');
      }
      
      if (password.length < 6) {
        throw ServerException('Şifre en az 6 karakter olmalı');
      }
      
      final user = _getMockUser(email);
      await _saveToken('mock_token_${user.id}');
      await _saveUser(user);
      return user;
    }
    
    if (!await network.isConnected) {
      throw NetworkException('İnternet bağlantısı yok');
    }
    
    try {
      final res = await api.post(
        ApiEndpoints.login,
        data: {'email': email, 'password': password},
      );
      
      if (res.statusCode == 200) {
        final token = res.data['token'];
        final user = UserModel.fromJson(res.data['user']);
        
        await _saveToken(token);
        await _saveUser(user);
        api.setToken(token);
        
        return user;
      }
      throw ServerException('Giriş başarısız');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<void> logout() async {
    await prefs.remove('auth_token');
    await prefs.remove('user_id');
    await prefs.remove('user_name');
    await prefs.remove('user_email');
    await prefs.remove('user_role');
    api.clearToken();
  }

  Future<bool> isLoggedIn() async {
    final token = prefs.getString('auth_token');
    return token != null && token.isNotEmpty;
  }

  Future<UserModel?> getCurrentUser() async {
    final id = prefs.getInt('user_id');
    final name = prefs.getString('user_name');
    final email = prefs.getString('user_email');
    final role = prefs.getString('user_role');
    
    if (id == null || name == null || email == null || role == null) {
      return null;
    }
    
    return UserModel(
      id: id,
      name: name,
      email: email,
      role: role,
    );
  }

  Future<void> _saveToken(String token) async {
    await prefs.setString('auth_token', token);
    api.setToken(token);
  }

  Future<void> _saveUser(UserModel user) async {
    await prefs.setInt('user_id', user.id);
    await prefs.setString('user_name', user.name);
    await prefs.setString('user_email', user.email);
    await prefs.setString('user_role', user.role);
    if (user.branchId != null) {
      await prefs.setInt('user_branch_id', user.branchId!);
    }
  }

  UserModel _getMockUser(String email) {
    return UserModel(
      id: 1,
      name: 'Ahmet Yılmaz',
      email: email,
      phone: '+90 555 123 4567',
      role: 'owner',
      branchId: 1,
    );
  }
}
