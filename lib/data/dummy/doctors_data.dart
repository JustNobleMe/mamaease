class Doctor {
  final String name;
  final String specialty;
  final String experience;
  final double rating;
  final String fee;
  final String image;
  final String about;
  final List<String> languages;
  final List<String> specialties;
  final List<String> availableDays;

  Doctor({
    required this.name,
    required this.specialty,
    required this.experience,
    required this.rating,
    required this.fee,
    required this.image,
    required this.about,
    required this.languages,
    required this.specialties,
    required this.availableDays,
  });
}

final List<Doctor> doctors = [
  Doctor(
    name: "Dr. Emily Roberts",
    specialty: "Obstetrician",
    experience: "10 Years",
    rating: 4.9,
    fee: "₦50,000",
    image: "",
    about:
        "Dr. Emily Roberts is a highly experienced maternal healthcare specialist dedicated to supporting women throughout pregnancy and childbirth.",
    languages: ["English", "French", "Spanish"],
    specialties: ["Obstetrics", "Gynecology", "Maternal Health"],
    availableDays: ["Monday - Friday", "9:00 AM - 5:00 PM"],
  ),
  Doctor(
    name: "Dr. Sarah Wilson",
    specialty: "Gynecologist",
    experience: "8 Years",
    rating: 4.8,
    fee: "₦45,000",
    image: "",
    about:
        "Dr. Sarah Wilson specializes in providing comprehensive care for women during pregnancy and childbirth.",
    languages: ["English", "French"],
    specialties: ["Gynecology", "Maternal Health"],
    availableDays: ["Tuesday - Saturday", "10:00 AM - 8:00 PM"],
  ),
  Doctor(
    name: "Dr. Michael Johnson",
    specialty: "Pediatrician",
    experience: "15 Years",
    rating: 4.7,
    fee: "₦55,000",
    image: "",
    about: 'Dr. Michael Johnson ',
    languages: ["English", "Spanish"],
    specialties: ["Pediatrics", "Child Health"],
    availableDays: ["Wednesday - Sunday", "11:00 AM - 9:00 PM"],
  ),
  Doctor(
    name: "Dr. Jessica Anderson",
    specialty: "Dermatologist",
    experience: "7 Years",
    rating: 4.6,
    fee: "₦40,000",
    image: "",
    about: 'Dr. Jessica Anderson ',
    languages: ["English", "German"],
    specialties: ["Dermatology", "Skin Care"],
    availableDays: ["Thursday - Saturday", "12:00 PM - 10:00 PM"],
  ),
  Doctor(
    name: "Dr. David Thompson",
    specialty: "Cardiologist",
    experience: "18 Years",
    rating: 4.5,
    fee: "₦45,000",
    image: "",
    about: 'Dr. David Thompson ',
    languages: ["English", "Italian"],
    specialties: ["Cardiology", "Heart Health"],
    availableDays: ["Friday - Sunday", "1:00 PM - 11:00 PM"],
  ),
  Doctor(
    name: "Dr. Olivia Brown",
    specialty: "Maternal Specialist",
    experience: "12 Years",
    rating: 5.0,
    fee: "₦60,000",
    image: "",
    about: 'Dr. Olivia Brown',
    languages: ["English", "Spanish"],
    specialties: ["Maternal Health", "Child Health"],
    availableDays: ["Saturday - Monday", "2:00 PM - 10:00 PM"],
  ),
];
