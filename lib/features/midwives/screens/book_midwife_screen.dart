import 'package:flutter/material.dart';
import 'package:myapp/data/dummy/midwives_data.dart';

class BookMidwifeScreen extends StatefulWidget {
  const BookMidwifeScreen({super.key});

  @override
  State<BookMidwifeScreen> createState() => _BookMidwifeScreenState();
}

class _BookMidwifeScreenState extends State<BookMidwifeScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final addressController = TextEditingController();
  final landmarkController = TextEditingController();
  final weekController = TextEditingController();

  final emergencyNameController = TextEditingController();

  final emergencyPhoneController = TextEditingController();

  final notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final midwife = ModalRoute.of(context)!.settings.arguments as Midwife;

    return Scaffold(
      appBar: AppBar(title: const Text("Book Home Visit")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _midwifeCard(midwife),

            const SizedBox(height: 20),

            const Text(
              "Visit Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            _dateField(),

            const SizedBox(height: 10),

            _timeField(),

            const SizedBox(height: 10),

            TextField(
              controller: weekController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Current Pregnancy Week",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Home Address",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: addressController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Full Address",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: landmarkController,
              decoration: const InputDecoration(
                labelText: "Nearest Landmark",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Additional Notes",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: notesController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: "Any symptoms, concerns or instructions...",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Emergency Contact",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: emergencyNameController,
              decoration: const InputDecoration(
                labelText: "Emergency Contact Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: emergencyPhoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Emergency Contact Phone",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [const Text("Visit Fee"), Text(midwife.fee)],
                    ),

                    const SizedBox(height: 10),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Service Charge"), Text("₦1,500")],
                    ),

                    const Divider(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          midwife.fee,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/booking-success');
                },
                child: const Text("Book Now"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _midwifeCard(Midwife midwife) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundImage: AssetImage(midwife.image)),
        title: Text(midwife.name),
        subtitle: Text(midwife.qualification),
        trailing: Text(midwife.fee),
      ),
    );
  }

  Widget _dateField() {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(),
      ),
      title: Text(
        selectedDate == null
            ? "Select Date"
            : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
      ),
      trailing: const Icon(Icons.calendar_today),
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime(2030),
          initialDate: DateTime.now(),
        );

        if (picked != null) {
          setState(() {
            selectedDate = picked;
          });
        }
      },
    );
  }

  Widget _timeField() {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(),
      ),
      title: Text(
        selectedTime == null ? "Select Time" : selectedTime!.format(context),
      ),
      trailing: const Icon(Icons.access_time),
      onTap: () async {
        final picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );

        if (picked != null) {
          setState(() {
            selectedTime = picked;
          });
        }
      },
    );
  }
}
