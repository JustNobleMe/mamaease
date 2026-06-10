import 'package:flutter/material.dart';

class HydrationTracker extends StatefulWidget {
  const HydrationTracker({super.key});

  @override
  State<HydrationTracker> createState() => _HydrationTrackerState();
}

class _HydrationTrackerState extends State<HydrationTracker> {
  int glassesDrank = 0;

  final int goal = 8;

  void addGlass() {
    if (glassesDrank < goal) {
      setState(() {
        glassesDrank++;
      });
    }
  }

  void removeGlass() {
    if (glassesDrank > 0) {
      setState(() {
        glassesDrank--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: const Color(0xFFD8C1EA),
        borderRadius: BorderRadius.circular(25),
      ),

      child: Column(
        children: [
          const Text(
            "Staying hydrated helps your baby thrive",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              goal,
              (index) => Icon(
                Icons.local_drink,
                size: 30,
                color: index < glassesDrank ? Colors.white : Colors.white54,
              ),
            ),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              goal,
              (index) => Icon(
                index < glassesDrank ? Icons.check : Icons.close,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.remove, size: 16),
                  onPressed: removeGlass,
                ),
              ),

              const SizedBox(width: 15),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "$glassesDrank / $goal Glasses",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(width: 15),

              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.add, size: 16),
                  onPressed: addGlass,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          LinearProgressIndicator(
            value: glassesDrank / goal,
            minHeight: 8,
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }
}
