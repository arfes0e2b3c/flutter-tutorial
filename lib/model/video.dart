class Video {
  final String title;

  Video({required this.title});

  factory Video.fromMap(Map<String, dynamic> json) => Video(
        title: json["snippet"]["title"],
      );
}
