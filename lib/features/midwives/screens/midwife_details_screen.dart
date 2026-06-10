import 'package:flutter/material.dart';
import 'package:myapp/data/dummy/midwives_data.dart';

class MidwifeDetailsScreen extends StatelessWidget {
  const MidwifeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Midwife midwife =
        ModalRoute.of(context)!.settings.arguments as Midwife;

    return Scaffold(
      appBar: AppBar(title: const Text("Midwife Details")),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(midwife.image),
            ),

            const SizedBox(height: 15),

            Text(
              midwife.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            Text(
              midwife.qualification,
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber),

                const SizedBox(width: 5),

                Text(midwife.rating.toString()),

                const SizedBox(width: 20),

                Text(midwife.experience),
              ],
            ),

            const SizedBox(height: 25),

            _sectionTitle("About"),

            _sectionCard(midwife.about),

            _sectionTitle("Services"),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: midwife.services
                    .map((service) => Chip(label: Text(service)))
                    .toList(),
              ),
            ),

            _sectionTitle("Availability"),

            _sectionCard(midwife.availability),

            _sectionTitle("Visit Fee"),

            _sectionCard("${midwife.fee} per visit"),

            _sectionTitle("Distance"),

            _sectionCard(midwife.distance),

            _sectionTitle("Reviews"),

            _reviewCard("Amaka", "Very professional and caring."),

            _reviewCard(
              "Blessing",
              "She guided me throughout my pregnancy journey.",
            ),

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
                      '/book-midwife',
                      arguments: midwife,
                    );
                  },
                  child: const Text("Book Home Visit"),
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
