import 'package:flutter/material.dart';
import 'package:myapp/app_colors.dart';
import 'package:myapp/data/dummy/midwives_data.dart';

class MidWivesScreen extends StatefulWidget {
  const MidWivesScreen({super.key});

  @override
  State<MidWivesScreen> createState() => _MidWivesScreeenState();
}

class _MidWivesScreeenState extends State<MidWivesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text('Mid-wives'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Book a Mid-wife",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 5),

                const Text(
                  "Book safe, professional home visits in just a few taps",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 8,
              bottom: 8,
            ),
            child: const Row(
              children: [
                Icon(Icons.location_on, color: AppColors.primary),

                SizedBox(width: 10),

                Expanded(
                  child: Text(
                    "We'll use your location to show available doctors near you.",
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ListView.builder(
                itemCount: midwives.length,
                itemBuilder: (context, index) {
                  final midwife = midwives[index];

                  return midwifeCard(context, midwife);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget midwifeCard(BuildContext context, Midwife midwife) {
  return Card(
    child: Padding(
      padding: const EdgeInsetsGeometry.all(8),
      child: Row(
        children: [
          CircleAvatar(radius: 22, backgroundImage: AssetImage(midwife.image)),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${midwife.name} | ${midwife.experience}",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                midwife.qualification,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 150, 149, 149),
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        midwife.distance,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 150, 149, 149),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Available:",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(height: 2),
                      Text(
                        midwife.availability,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 150, 149, 149),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${midwife.fee} per visit",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          SizedBox(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(8, 28),
                                padding: EdgeInsets.symmetric(horizontal: 8),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/midwife-details',
                                  arguments: midwife,
                                );
                              },
                              child: const Text(
                                "View Profile",
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          SizedBox(width: 4),
                          SizedBox(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(8, 28),
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                backgroundColor: AppColors.primary,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/book-midwife',
                                  arguments: midwife,
                                );
                              },
                              child: const Text(
                                "Book Now",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
