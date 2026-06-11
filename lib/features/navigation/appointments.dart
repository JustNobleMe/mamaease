import 'package:flutter/material.dart';
import 'package:myapp/app_colors.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),

      appBar: AppBar(
        title: const Text("Appointments"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Manage Your Care",
                    style: TextStyle(color: Colors.white70),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "2 Upcoming Appointments",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Upcoming Doctor Appointment",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            _appointmentCard(
              icon: Icons.medical_services,
              name: "Dr. Sarah Williams",
              date: "12 June 2026",
              time: "10:00 AM",
              status: "Confirmed",
              type: "Virtual Consultation",
            ),

            const SizedBox(height: 20),

            const Text(
              "Upcoming Midwife Visit",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            _appointmentCard(
              icon: Icons.health_and_safety,
              name: "Dr. Tolu Adekunle",
              date: "14 June 2026",
              time: "3:00 PM",
              status: "Confirmed",
              type: "Home Visit",
            ),

            const SizedBox(height: 25),

            const Text(
              "Quick Actions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/doctors');
                    },
                    icon: const Icon(
                      Icons.medical_services,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Book Doctor",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/midwives');
                    },
                    icon: const Icon(Icons.favorite, color: Colors.white),
                    label: const Text(
                      "Book Midwife",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "Appointment History",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            _historyCard("Dr. Michael Johnson", "Completed", "20 May 2026"),

            _historyCard("Dr. Grace Adams", "Completed", "05 May 2026"),

            _historyCard("Dr. David Peters", "Cancelled", "28 April 2026"),
          ],
        ),
      ),
    );
  }

  Widget _appointmentCard({
    required IconData icon,
    required String name,
    required String date,
    required String time,
    required String status,
    required String type,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child: Icon(icon, color: Colors.white),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),

                      Text(type),
                    ],
                  ),
                ),
              ],
            ),

            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(date), Text(time)],
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(status),
                  backgroundColor: Colors.green.shade100,
                ),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text("View Details"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _historyCard(String doctor, String status, String date) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.history)),
        title: Text(doctor),
        subtitle: Text(date),
        trailing: Text(
          status,
          style: TextStyle(
            color: status == "Completed" ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
