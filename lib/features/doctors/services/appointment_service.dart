import '../../../core/services/api_service.dart';
import '../model/appointment_request.dart';

class AppointmentService {
  final ApiService _api = ApiService();

  Future<void> bookAppointment(AppointmentRequest request) async {
    final response = await _api.post("/appointments", request.toJson());

    if (response.statusCode == 200 || response.statusCode == 201) {
      return;
    }

    throw Exception("Unable to book appointment");
  }
}
