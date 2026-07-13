class DashboardModel {
  final UserSummary user;
  final PregnancySummary? pregnancy;
  final AppointmentSummary? appointment;

  DashboardModel({required this.user, this.pregnancy, this.appointment});

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      user: UserSummary.fromJson(json['user']),
      pregnancy: json['pregnancy'] != null
          ? PregnancySummary.fromJson(json['pregnancy'])
          : null,
      appointment:
          json['appointment'] != null && (json['appointment'] as Map).isNotEmpty
          ? AppointmentSummary.fromJson(json['appointment'])
          : null,
    );
  }
}

class UserSummary {
  final String fullName;
  final String? profileImage;

  UserSummary({required this.fullName, this.profileImage});

  factory UserSummary.fromJson(Map<String, dynamic> json) {
    return UserSummary(
      fullName: json['fullName'],
      profileImage: json['profileImage'],
    );
  }
}

class PregnancySummary {
  final int currentWeek;
  final int progress;
  final String dueDate;

  PregnancySummary({
    required this.currentWeek,
    required this.progress,
    required this.dueDate,
  });

  factory PregnancySummary.fromJson(Map<String, dynamic> json) {
    return PregnancySummary(
      currentWeek: json['currentWeek'],
      progress: json['progress'],
      dueDate: json['dueDate'],
    );
  }
}

class AppointmentSummary {
  final String name;
  final String type;
  final String date;
  final String time;

  AppointmentSummary({
    required this.name,
    required this.type,
    required this.date,
    required this.time,
  });

  factory AppointmentSummary.fromJson(Map<String, dynamic> json) {
    return AppointmentSummary(
      name: json['name'],
      type: json['type'],
      date: json['date'],
      time: json['time'],
    );
  }
}
