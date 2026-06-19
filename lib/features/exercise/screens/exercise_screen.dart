import 'package:flutter/material.dart';
import 'package:myapp/data/dummy/exercise_data.dart';
import 'package:myapp/app_colors.dart';
import './player_screen.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(title: const Text('Pregnancy Exercises')),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: exerciseVideos.length,
        itemBuilder: (context, index) {
          return ExerciseCard(exercise: exerciseVideos[index]);
        },
      ),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final ExerciseVideo exercise;

  const ExerciseCard({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),

      clipBehavior: Clip.antiAlias,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(exercise.thumbnail, fit: BoxFit.cover),

          Padding(
            padding: const EdgeInsets.all(12),

            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exercise.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        exercise.duration,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            icon: const Icon(
              Icons.play_circle_fill,
              size: 40,
              color: AppColors.primary,
            ),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ExercisePlayerScreen(
                    youtubeUrl: exercise.youtubeUrl,
                    title: exercise.title,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
