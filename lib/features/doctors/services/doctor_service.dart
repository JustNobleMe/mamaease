import 'dart:convert';

import 'package:myapp/core/services/api_service.dart';

import '../model/doctor_model.dart';

class DoctorService {
  final ApiService _api = ApiService();

  Future<List<Doctor>> getDoctors() async {
    final response = await _api.get("/doctors");

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data.map((e) => Doctor.fromJson(e)).toList();
    }

    throw Exception("Unable to load doctors");
  }

  Future<Doctor> getDoctor(String id) async {
    final response = await _api.get("/doctors/$id");

    if (response.statusCode == 200) {
      return Doctor.fromJson(jsonDecode(response.body));
    }

    throw Exception("Unable to load doctor");
  }
}
