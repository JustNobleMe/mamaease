import 'package:flutter/material.dart';
import 'package:myapp/app_colors.dart';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  final TextEditingController initialWeightController = TextEditingController(
    text: "65",
  );

  final TextEditingController currentWeightController = TextEditingController(
    text: "70",
  );

  double weightGain = 5;

  int waterCount = 5;

  bool hydrated = false;
  bool appointment = false;
  bool stretches = false;
  bool vitamins = false;

  void calculateWeightGain() {
    final initial = double.tryParse(initialWeightController.text) ?? 0;

    final current = double.tryParse(currentWeightController.text) ?? 0;

    setState(() {
      weightGain = current - initial;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Pregnancy Tracker",
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// PROGRESS CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pregnancy Progress",
                    style: TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Week 24",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const LinearProgressIndicator(
                      value: 0.60,
                      minHeight: 10,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "60% Completed",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// WEIGHT TRACKER
            const Text(
              "Enter your weight information below:",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: initialWeightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Initial Weight",
                suffixText: "kg",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: currentWeightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Current Weight",
                suffixText: "kg",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "${weightGain.toStringAsFixed(0)} kg",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                onPressed: calculateWeightGain,
                child: const Text(
                  "Calculate",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Here's what's happening in your body this week:",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 15),

            /// BABY DEVELOPMENT CARD
            _infoCard(
              image: "assets/images/baby_week24.jpg",
              text:
                  "Your baby's eyes are starting to open, and they're practicing breathing.",
              imageLeft: true,
            ),

            const SizedBox(height: 15),

            /// MOTHER BODY CHANGES
            _infoCard(
              image: "assets/images/body_changes.jpg",
              text:
                  "Back pain, leg cramps, and vivid dreams are common this week.",
              imageLeft: false,
            ),

            const SizedBox(height: 30),

            /// HYDRATION TRACKER
            const Text(
              "Hydration Tracker",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(95, 105, 31, 124),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      8,
                      (index) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.local_drink,
                            size: 35,
                            color: index < waterCount
                                ? AppColors.primary
                                : Colors.white,
                          ),

                          const SizedBox(height: 4),

                          Icon(
                            Icons.check,
                            color: index < waterCount
                                ? Colors.green
                                : Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.remove, size: 16),
                          onPressed: () {
                            if (waterCount > 0) {
                              setState(() {
                                waterCount--;
                              });
                            }
                          },
                        ),
                      ),

                      const SizedBox(width: 15),

                      ElevatedButton.icon(
                        onPressed: () {
                          if (waterCount < 8) {
                            setState(() {
                              waterCount++;
                            });
                          }
                        },
                        icon: const Icon(Icons.add),
                        label: const Text("Add"),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// WEEKLY CHECKLIST
            const Text(
              "Weekly Checklist",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            _checklistTile(
              "Stay hydrated; aim for 8+ glasses of water daily",
              hydrated,
              (value) {
                setState(() {
                  hydrated = value ?? false;
                });
              },
            ),

            _checklistTile(
              "Book your next antenatal appointment",
              appointment,
              (value) {
                setState(() {
                  appointment = value ?? false;
                });
              },
            ),

            _checklistTile("Do 15 minutes of pelvic stretches", stretches, (
              value,
            ) {
              setState(() {
                stretches = value ?? false;
              });
            }),

            _checklistTile("Take prenatal vitamins", vitamins, (value) {
              setState(() {
                vitamins = value ?? false;
              });
            }),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _infoCard({
    required String image,
    required String text,
    required bool imageLeft,
  }) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: imageLeft
            ? [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    image,
                    width: 160,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      text,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ]
            : [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      text,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    image,
                    width: 160,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
      ),
    );
  }

  Widget _checklistTile(String title, bool value, Function(bool?) onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CheckboxListTile(
        value: value,
        onChanged: onChanged,
        title: Text(title, style: const TextStyle(color: Colors.white)),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
