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
    thumbnail: "https://img.youtube.com/vi/VIDEO_ID/maxresdefault.jpg",
    duration: "20 Minutes",
    youtubeUrl: "https://www.youtube.come/watch?v=dQw4w9WgXcQ",
  ),
  ExerciseVideo(
    title: "Best Pregnancy Exercises For Normal Delivery",
    thumbnail: "https://img.youtube.com/vi/VIDEO_ID/maxresdefault.jpg",
    duration: "20 Minutes",
    youtubeUrl: "https://www.youtube.com/watch?v=aqz-KE-bpKQ",
  ),

  ExerciseVideo(
    title: "Week 37 Full Body Prenatal Workout",
    thumbnail: "https://img.youtube.com/vi/VIDEO_ID/maxresdefault.jpg",
    duration: "25 Minutes",
    youtubeUrl: "https://www.youtube.com/watch?v=jNQXAC9IVRw",
  ),
];
