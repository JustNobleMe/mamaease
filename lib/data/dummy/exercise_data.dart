class ExerciseVideo {
  final String title;
  final String thumbnail;
  final String duration;
  final String youtubeUrl;

  ExerciseVideo({
    required this.title,
    required this.thumbnail,
    required this.duration,
    required this.youtubeUrl,
  });
}

final List<ExerciseVideo> exerciseVideos = [
  ExerciseVideo(
    title: "Pregnancy Exercise For Normal Delivery",
    thumbnail: "assets/images/exercises.png",
    duration: "20 Minutes",
    youtubeUrl: "https://www.youtube.com/watch?v=pH7sWPBsyiM",
  ),
  ExerciseVideo(
    title: "Best Pregnancy Exercises For Normal Delivery",
    thumbnail: "assets/images/exercises.png",
    duration: "20 Minutes",
    youtubeUrl: "https://www.youtube.com/watch?v=YWt3qH-glTw",
  ),

  ExerciseVideo(
    title: "Week 37 Full Body Prenatal Workout",
    thumbnail: "assets/images/exercises.png",
    duration: "25 Minutes",
    youtubeUrl: "https://www.youtube.com/watch?v=Z66rhf26XNs",
  ),
];
