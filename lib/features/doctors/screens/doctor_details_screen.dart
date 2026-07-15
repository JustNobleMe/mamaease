import 'package:flutter/material.dart';
import '../model/doctor_model.dart';
import '../services/doctor_service.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({super.key});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  final DoctorService _doctorService = DoctorService();

  Doctor? doctor;
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (doctor == null) {
      final doctorId = ModalRoute.of(context)!.settings.arguments as String;

      loadDoctor(doctorId);
    }
  }

  Future<void> loadDoctor(String id) async {
    try {
      final data = await _doctorService.getDoctor(id);

      if (!mounted) return;

      setState(() {
        doctor = data;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString().replaceFirst("Exception: ", ""))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (doctor == null) {
      return const Scaffold(body: Center(child: Text("Doctor not found")));
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Doctor Details")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            CircleAvatar(
              radius: 60,
              backgroundImage:
                  doctor!.image != null && doctor!.image!.isNotEmpty
                  ? NetworkImage(doctor!.image!)
                  : null,
              child: doctor!.image == null || doctor!.image!.isEmpty
                  ? const Icon(Icons.person, size: 60)
                  : null,
            ),

            const SizedBox(height: 15),

            Text(
              doctor!.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            Text(
              doctor!.speciality,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber),

                const SizedBox(width: 5),

                Text(doctor!.rating.toString()),

                const SizedBox(width: 20),

                Text(doctor!.experience),
              ],
            ),

            const SizedBox(height: 25),

            _sectionTitle("Qualification"),

            _sectionCard(doctor!.qualification),

            _sectionTitle("Hospital"),

            _sectionCard(doctor!.hospital),

            _sectionTitle("About"),

            _sectionCard(doctor!.about),

            _sectionTitle("Consultation Fee"),

            _sectionCard("₦${doctor!.fee.toStringAsFixed(0)}"),

            _sectionTitle("Available Schedule"),

            _sectionCard("Monday - Friday\n9:00 AM - 5:00 PM"),

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

  Widget _sectionTitle(String title) {
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

  Widget _sectionCard(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        child: Padding(padding: const EdgeInsets.all(16), child: Text(text)),
      ),
    );
  }

  Widget _reviewCard(String name, String review) {
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
