import 'package:dio/dio.dart';
import '../api/api_client.dart';
import '../models/user_model.dart';
import 'storage_service.dart';

class AuthService {
  final Dio _dio = ApiClient.dio;

  Future<Map<String, dynamic>> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    final response = await _dio.post(
      '/auth/register',
      data: {
        'fullName': fullName,
        'email': email,
        'phone': phone,
        'password': password,
      },
    );

    final token = response.data['access_token'];
    if (token != null) {
      await StorageService.saveToken(token);
    }

    return response.data;
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      '/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    print('Login response data: ${response.data}');

    final token = response.data['access_token'];
    if (token != null) {
      await StorageService.saveToken(token);
    }

    final saved = await StorageService.getToken();
    print('Stored token after login: $saved');

    return response.data;
  }

    //current user
    Future<UserModel> me() async {
        final token = await StorageService.getToken();

        final response = await _dio.get(
            "/auth/me",
            options: Options(
                headers: {
                    "Authorization": "Bearer $token",
                },
            ),
        );

        return UserModel.fromJson(response.data);
    }

    /// logout
    Future<void> logout() async {
        await StorageService.clearToken();
    }
}