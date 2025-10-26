import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'widgets/video_player_mobile.dart';
import 'widgets/video_player_web.dart';

class VideoPlayerWidget extends StatelessWidget {
  final String videoUrl;

  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    // Jika dijalankan di web, gunakan VideoPlayerWeb
    if (kIsWeb) {
      return VideoPlayerWeb(videoUrl: videoUrl);
    }

    // Jika dijalankan di mobile (Android/iOS), gunakan VideoPlayerMobile
    return VideoPlayerMobile(videoUrl: videoUrl);
  }
}
