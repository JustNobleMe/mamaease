import 'package:flutter/material.dart';
import '../../../data/dummy/doctors_data.dart';

class AppointmentBookingScreen extends StatefulWidget {
  const AppointmentBookingScreen({super.key});

  @override
  State<AppointmentBookingScreen> createState() =>
      _AppointmentBookingScreenState();
}

class _AppointmentBookingScreenState
    extends State<AppointmentBookingScreen> {
  DateTime? selectedDate;

  String selectedTime = "10:00 AM";

  String consultationType = "Video Call";

  final TextEditingController notesController =
      TextEditingController();

  final List<String> availableTimes = [
    "09:00 AM",
    "10:00 AM",
    "11:00 AM",
    "01:00 PM",
    "02:00 PM",
    "03:00 PM",
  ];

  Future<void> pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2027),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Doctor doctor =
        ModalRoute.of(context)!.settings.arguments as Doctor;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Book Appointment",
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            // Doctor Card
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text(doctor.name),
                subtitle:
                    Text(doctor.specialty),
              ),
            ),

            const SizedBox(height: 25),

            // Date
            const Text(
              "Select Date",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: pickDate,
                icon:
                    const Icon(Icons.calendar_month),
                label: Text(
                  selectedDate == null
                      ? "Choose Date"
                      : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Time
            const Text(
              "Select Time",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            DropdownButtonFormField<String>(
              value: selectedTime,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12),
                ),
              ),
              items: availableTimes
                  .map(
                    (time) =>
                        DropdownMenuItem(
                      value: time,
                      child: Text(time),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedTime = value!;
                });
              },
            ),

            const SizedBox(height: 25),

            // Consultation Type
            const Text(
              "Consultation Type",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            RadioListTile(
              title: const Text(
                "Video Call",
              ),
              value: "Video Call",
              groupValue:
                  consultationType,
              onChanged: (value) {
                setState(() {
                  consultationType =
                      value.toString();
                });
              },
            ),

            RadioListTile(
              title: const Text(
                "Voice Call",
              ),
              value: "Voice Call",
              groupValue:
                  consultationType,
              onChanged: (value) {
                setState(() {
                  consultationType =
                      value.toString();
                });
              },
            ),

            RadioListTile(
              title: const Text(
                "Physical Visit",
              ),
              value: "Physical Visit",
              groupValue:
                  consultationType,
              onChanged: (value) {
                setState(() {
                  consultationType =
                      value.toString();
                });
              },
            ),

            const SizedBox(height: 20),

            // Notes
            const Text(
              "Symptoms / Notes",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: notesController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText:
                    "Describe your symptoms...",
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Confirm Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/booking-success',
                  );
                },
                child: const Text(
                  "Confirm Appointment",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}