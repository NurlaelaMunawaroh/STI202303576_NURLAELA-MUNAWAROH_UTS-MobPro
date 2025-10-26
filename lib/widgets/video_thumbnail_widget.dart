import 'package:flutter/material.dart';
import '../video_player_widget.dart';

class VideoThumbnailWidget extends StatefulWidget {
  final String videoUrl;
  final String thumbnailUrl;

  const VideoThumbnailWidget({
    super.key,
    required this.videoUrl,
    required this.thumbnailUrl,
  });

  @override
  State<VideoThumbnailWidget> createState() => _VideoThumbnailWidgetState();
}

class _VideoThumbnailWidgetState extends State<VideoThumbnailWidget> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return _isPlaying
        ? VideoPlayerWidget(videoUrl: widget.videoUrl)
        : GestureDetector(
            onTap: () {
              setState(() {
                _isPlaying = true;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Thumbnail gambar
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    widget.thumbnailUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Container(
                        height: 200,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.broken_image,
                        size: 48,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),

                // Tombol play di tengah
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ],
            ),
          );
  }
}
