class Doctor {
  final String id;
  final String name;
  final String speciality;
  final String qualification;
  final String hospital;
  final String experience;
  final double fee;
  final double rating;
  final String about;
  final String? image;

  Doctor({
    required this.id,
    required this.name,
    required this.speciality,
    required this.qualification,
    required this.hospital,
    required this.experience,
    required this.fee,
    required this.rating,
    required this.about,
    this.image,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      speciality: json['speciality'] ?? '',
      qualification: json['qualification'] ?? '',
      hospital: json['hospital'] ?? '',
      experience: json['experience'] ?? '',
      fee: (json['fee'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      about: json['about'] ?? '',
      image: json['image'],
    );
  }
}