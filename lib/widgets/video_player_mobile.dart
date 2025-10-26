import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerMobile extends StatefulWidget {
  final String videoUrl; // URL atau path video

  const VideoPlayerMobile({super.key, required this.videoUrl});

  @override
  State<VideoPlayerMobile> createState() => _VideoPlayerMobileState();
}

class _VideoPlayerMobileState extends State<VideoPlayerMobile> {
  late VideoPlayerController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.isInitialized
          ? _controller.value.aspectRatio
          : 16 / 9,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Area video player
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : GestureDetector(
                  onTap: _togglePlayPause,
                  child: VideoPlayer(_controller),
                ),

          // Tombol play di tengah saat video belum diputar
          if (!_controller.value.isPlaying && !_isLoading)
            IconButton(
              icon: const Icon(
                Icons.play_circle_fill,
                color: Colors.white,
                size: 60,
              ),
              onPressed: _togglePlayPause,
            ),

          // Progress bar video
          if (!_isLoading)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: VideoProgressIndicator(
                _controller,
                allowScrubbing: true,
                colors: const VideoProgressColors(
                  playedColor: Colors.teal,
                  backgroundColor: Colors.grey,
                  bufferedColor: Colors.white70,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
