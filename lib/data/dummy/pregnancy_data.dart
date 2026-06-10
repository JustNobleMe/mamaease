class PregnancyData {
  final int currentWeek;
  final double initialWeight;
  final double currentWeight;
  final String babySize;

  PregnancyData({
    required this.currentWeek,
    required this.initialWeight,
    required this.currentWeight,
    required this.babySize,
  });
}

final pregnancyData = PregnancyData(
  currentWeek: 24,
  initialWeight: 60.0,
  currentWeight: 67.5,
  babySize: "Corn",
);
