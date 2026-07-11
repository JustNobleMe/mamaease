import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  UserModel? user;
  bool isLoading = false;

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      final result = await _authService.login(
        email: email,
        password: password,
      );

      final token = result['access_token'];
      if (token == null || token.toString().isEmpty) {
        return false;
      }

      try {
        user = await _authService.me();
      } catch (e) {
        print('Could not load current user after login: $e');
      }

      return true;
    } catch (e) {
      print('Login failed: $e');
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      await _authService.register(
        fullName: fullName,
        email: email,
        phone: phone,
        password: password,
      );

      user = await _authService.me();
      return true;
    } catch (e) {
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadUser() async {
    try {
      user = await _authService.me();
      notifyListeners();
    } catch (_) {}
  }

  Future<void> logout() async {
    await _authService.logout();
    user = null;
    notifyListeners();
  }
}