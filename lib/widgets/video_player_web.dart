import 'dart:ui_web' as ui;

import 'package:flutter/material.dart';
// ignore: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:html' as html;

class VideoPlayerWeb extends StatefulWidget {
  final String videoUrl; // URL video dari internet

  const VideoPlayerWeb({super.key, required this.videoUrl});

  @override
  State<VideoPlayerWeb> createState() => _VideoPlayerWebState();
}

class _VideoPlayerWebState extends State<VideoPlayerWeb> {
  late html.VideoElement _videoElement;
  late Widget _videoWidget;

  @override
  void initState() {
    super.initState();

    // Membuat elemen video HTML
    _videoElement = html.VideoElement()
      ..src = widget.videoUrl
      ..controls = true
      ..style.borderRadius = '16px'
      ..style.width = '100%'
      ..style.height = 'auto';

    // Menyambungkan elemen video ke Flutter
    _videoWidget = HtmlElementView(viewType: widget.videoUrl);

    // Registrasi video element
    // ignore: undefined_prefixed_name
    // (perlu registrasi untuk HTML renderer)
    // Ini akan dipanggil otomatis oleh Flutter Web
    // untuk menyambungkan elemen HTML ke widget Flutter
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      widget.videoUrl,
      (int viewId) => _videoElement,
    );
  }

  @override
  void dispose() {
    _videoElement.pause();
    _videoElement.removeAttribute('src');
    _videoElement.load();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: _videoWidget,
      ),
    );
  }
}
