import 'package:flutter/material.dart';
import '../../../data/dummy/doctors_data.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Doctor doctor = ModalRoute.of(context)!.settings.arguments as Doctor;

    return Scaffold(
      appBar: AppBar(title: const Text("Doctor Details")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Doctor Image
            const CircleAvatar(radius: 60, child: Icon(Icons.person, size: 60)),

            const SizedBox(height: 15),

            Text(
              doctor.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            Text(
              doctor.specialty,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber),

                const SizedBox(width: 5),

                Text(doctor.rating.toString()),

                const SizedBox(width: 20),

                Text(doctor.experience),
              ],
            ),

            const SizedBox(height: 25),

            // About
            _sectionTitle("About"),

            _sectionCard(
              "Dr. ${doctor.name} is a highly experienced maternal healthcare specialist dedicated to supporting women throughout pregnancy and childbirth.",
            ),

            // Languages
            _sectionTitle("Languages"),

            _sectionCard("English, French, Spanish"),

            // Consultation Fee
            _sectionTitle("Consultation Fee"),

            _sectionCard(doctor.fee),

            // Schedule
            _sectionTitle("Available Schedule"),

            _sectionCard("Monday - Friday\n9:00 AM - 5:00 PM"),

            // Reviews
            _sectionTitle("Patient Reviews"),

            _reviewCard("Sarah", "Very caring and professional doctor."),

            _reviewCard("Jessica", "Made my pregnancy journey easier."),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/book-appointment',
                      arguments: doctor,
                    );
                  },
                  child: const Text("Book Appointment"),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  static Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  static Widget _sectionCard(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        child: Padding(padding: const EdgeInsets.all(16), child: Text(text)),
      ),
    );
  }

  static Widget _reviewCard(String name, String review) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Card(
        child: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(name),
          subtitle: Text(review),
        ),
      ),
    );
  }
}
