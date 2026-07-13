import 'dart:convert';

import 'package:myapp/core/services/api_service.dart';

import '../models/dashboard_model.dart';

class DashboardService {
  final ApiService _api = ApiService();

  Future<DashboardModel> getDashboard() async {
    final response = await _api.get("/dashboard");

    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = jsonDecode(response.body);

      return DashboardModel.fromJson(json);
    }

    throw Exception("Unable to load dashboard");
  }
}
