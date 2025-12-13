import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio _dio = Dio();

  // Đăng nhập
  Future<bool> login(String username, String password) async {
    try {
      final res = await _dio.post(
        "https://dummyjson.com/auth/login",
        data: {
          "username": username,
          "password": password,
          "expiresInMins": 60,
        },
        options: Options(
          contentType: "application/json",
          validateStatus: (_) => true,
        ),
      );

      if (res.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", res.data["accessToken"]);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // Lấy profile
  Future<Map<String, dynamic>?> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    if (token == null) return null;

    try {
      final res = await _dio.get(
        "https://dummyjson.com/auth/me",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      return res.data;
    } catch (e) {
      return null;
    }
  }

  // Đăng xuất
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
  }
}

final authService = AuthService();
