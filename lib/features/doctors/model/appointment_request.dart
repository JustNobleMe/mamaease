class AppointmentRequest {
  final String? doctorId;
  final String? midwifeId;
  final DateTime date;
  final String type;
  final String notes;

  AppointmentRequest({
    this.doctorId,
    this.midwifeId,
    required this.date,
    required this.type,
    required this.notes,
  });

  Map<String, dynamic> toJson() {
    return {
      "doctorId": doctorId,
      "midwifeId": midwifeId,
      "date": date.toIso8601String(),
      "type": type,
      "notes": notes,
    };
  }
}