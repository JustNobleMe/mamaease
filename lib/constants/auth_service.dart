import 'dart:convert';

import 'package:myapp/core/constants/api_constants.dart';
import 'package:myapp/core/services/api_service.dart';
import 'package:myapp/core/services/storage_service.dart';
import 'package:myapp/models/auth_response.dart';
import 'package:myapp/models/user.dart';

class AuthService {
  final ApiService _api = ApiService();
  final StorageService _storage = StorageService();

  Future<AuthResponse> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    final response = await _api.post(ApiConstants.register, {
      "fullName": fullName,
      "email": email,
      "phone": phone,
      "password": password,
    });

    if (response.statusCode == 201 || response.statusCode == 200) {
      final auth = AuthResponse.fromJson(jsonDecode(response.body));

      await _storage.saveToken(auth.accessToken);

      return auth;
    }

    throw Exception(jsonDecode(response.body)["message"]);
  }

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await _api.post(ApiConstants.login, {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      final auth = AuthResponse.fromJson(jsonDecode(response.body));

      await _storage.saveToken(auth.accessToken);

      return auth;
    }

    throw Exception(jsonDecode(response.body)["message"]);
  }

  Future<User> getCurrentUser() async {
    final response = await _api.get(ApiConstants.me);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    }

    throw Exception("Failed to fetch user.");
  }

  Future<void> logout() async {
    await _storage.clearToken();
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.getToken();

    if (token == null) {
      return false;
    }

    try {
      await getCurrentUser();
      return true;
    } catch (_) {
      await _storage.clearToken();
      return false;
    }
  }
}
