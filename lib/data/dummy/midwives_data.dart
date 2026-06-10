class Midwife {
  final String name;
  final String image;
  final String qualification;
  final String experience;
  final String distance;
  final String availability;
  final String fee;
  final double rating;
  final String about;
  final List<String> services;

  Midwife({
    required this.name,
    required this.image,
    required this.qualification,
    required this.experience,
    required this.distance,
    required this.availability,
    required this.fee,
    required this.rating,
    required this.about,
    required this.services,
  });
}

final List<Midwife> midwives = [
  Midwife(
    name: "Dr. Tolu Adekunle",
    image: "assets/images/midwife1.jpg",
    qualification: "Obstetrician-Gynecologist",
    experience: "10+ Years",
    distance: "1 km away",
    availability: "Today, 3:00 PM - 6:00 PM",
    fee: "₦10,500",
    rating: 4.9,
    about:
        "Dr. Tolu Adekunle is an experienced maternal healthcare specialist with over 10 years of practice in prenatal, delivery, and postnatal care. She is dedicated to helping mothers experience safe pregnancies and healthy childbirth.",
    services: [
      "Home Visits",
      "Prenatal Care",
      "Postnatal Care",
      "Pregnancy Counseling",
      "Breastfeeding Support",
    ],
  ),

  Midwife(
    name: "Dr. Adebiyi Mary",
    image: "assets/images/midwife2.jpg",
    qualification: "Certified Mid-Wife",
    experience: "8 Years",
    distance: "200 m away",
    availability: "Today, 8:00 AM - 12:00 PM",
    fee: "₦6,500",
    rating: 4.7,
    about:
        "Mary Adebiyi is a certified midwife passionate about supporting expectant mothers throughout pregnancy and childbirth. She specializes in home-based maternal care and newborn support.",
    services: [
      "Home Visits",
      "Prenatal Monitoring",
      "Newborn Care",
      "Postnatal Recovery",
      "Nutrition Guidance",
    ],
  ),

  Midwife(
    name: "Dr. Alex Michael",
    image: "assets/images/midwife3.jpg",
    qualification: "Obstetrician-Gynecologist",
    experience: "9 Years",
    distance: "1 km away",
    availability: "Today, 6:00 PM - 9:00 PM",
    fee: "₦15,000",
    rating: 4.8,
    about:
        "Dr. Alex Michael combines clinical obstetric expertise with personalized maternal support. He has helped hundreds of women through high-risk and routine pregnancies.",
    services: [
      "Home Visits",
      "High-Risk Pregnancy Care",
      "Prenatal Consultation",
      "Emergency Maternal Support",
      "Postnatal Follow-up",
    ],
  ),

  Midwife(
    name: "Dr. Wilson Juliet",
    image: "assets/images/midwife4.jpg",
    qualification: "Certified Mid-Wife",
    experience: "5 Years",
    distance: "1 km away",
    availability: "Today, 9:00 AM - 1:00 PM",
    fee: "₦10,300",
    rating: 4.6,
    about:
        "Juliet Wilson is a certified midwife focused on providing compassionate maternal care. She supports mothers through pregnancy, delivery preparation, and newborn care.",
    services: [
      "Home Visits",
      "Prenatal Care",
      "Delivery Preparation",
      "Breastfeeding Assistance",
      "Infant Care Education",
    ],
  ),
];
