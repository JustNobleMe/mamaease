import 'package:flutter/material.dart';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  final List<Map<String, dynamic>> checklist = [
    {"title": "Drink 8 glasses of water", "completed": true},
    {"title": "Take prenatal vitamins", "completed": false},
    {"title": "30 minutes walk", "completed": true},
    {"title": "Track baby movement", "completed": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),

      appBar: AppBar(title: const Text("Pregnancy Tracker")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: const Color(0xFF8E5A9B),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Current Pregnancy",
                    style: TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Week 24",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: LinearProgressIndicator(value: 0.60, minHeight: 10),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "60% Completed",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Weight Section
            const Text(
              "Weight Tracking",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: const [
                          Text("Initial", style: TextStyle(color: Colors.grey)),
                          SizedBox(height: 8),
                          Text(
                            "60kg",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: const [
                          Text("Current", style: TextStyle(color: Colors.grey)),
                          SizedBox(height: 8),
                          Text(
                            "67.5kg",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Baby Growth
            const Text(
              "Baby Growth",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: Icon(Icons.child_care, color: Color(0xFF8E5A9B)),
                title: Text("Baby Size"),
                subtitle: Text("As big as a Corn 🌽"),
              ),
            ),

            const SizedBox(height: 20),

            // Weekly Milestones
            const Text(
              "Weekly Milestones",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Your baby is developing stronger hearing and may respond to sounds.",
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Checklist
            const Text(
              "Weekly Checklist",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: checklist.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  value: checklist[index]["completed"],
                  title: Text(checklist[index]["title"]),
                  onChanged: (value) {
                    setState(() {
                      checklist[index]["completed"] = value;
                    });
                  },
                );
              },
            ),

            const SizedBox(height: 20),

            // Appointment Card
            const Text(
              "Next Appointment",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: CircleAvatar(child: Icon(Icons.event)),
                title: Text("Antenatal Checkup"),
                subtitle: Text("12 June 2026 • 10:00 AM"),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
