import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tutorial/model/video.dart';

class YouTubeRepository {
  Future<List<Video>> fetchVideos() async {
    final response = await http.get(
      Uri.https(
        'www.googleapis.com',
        '/youtube/v3/search',
        {
          'part': 'snippet',
          'q': 'python',
          'key': '',
        },
      ),
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      print(parsed);
      final videos =
          parsed['items'].map<Video>((json) => Video.fromMap(json)).toList();
      return videos;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
