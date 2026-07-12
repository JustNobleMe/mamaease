import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import 'storage_service.dart';

class ApiService {
  final StorageService storage = StorageService();

  Future<Map<String, String>> _headers() async {
    final token = await storage.getToken();

    return {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };
  }

  Future<http.Response> get(String endpoint) async {
    return await http.get(
      Uri.parse(ApiConstants.baseUrl + endpoint),
      headers: await _headers(),
    );
  }

  Future<http.Response> post(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    return await http.post(
      Uri.parse(ApiConstants.baseUrl + endpoint),
      headers: await _headers(),
      body: jsonEncode(body),
    );
  }

  Future<http.Response> patch(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    return await http.patch(
      Uri.parse(ApiConstants.baseUrl + endpoint),
      headers: await _headers(),
      body: jsonEncode(body),
    );
  }

  Future<http.Response> delete(
    String endpoint,
  ) async {
    return await http.delete(
      Uri.parse(ApiConstants.baseUrl + endpoint),
      headers: await _headers(),
    );
  }
}