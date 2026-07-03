import 'dart:ui_web' as ui_web;

import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

import '../utils/youtube_utils.dart';

final Set<String> _registeredViewTypes = {};

/// Embeds a YouTube video inline on Flutter Web via a native <iframe>,
/// registered as a platform view. Web-only by design — this project
/// targets Flutter Web exclusively.
class YoutubeIframeView extends StatelessWidget {
  final String videoId;

  const YoutubeIframeView({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    final viewType = 'youtube-iframe-$videoId';

    if (_registeredViewTypes.add(viewType)) {
      ui_web.platformViewRegistry.registerViewFactory(viewType, (int viewId) {
        return web.HTMLIFrameElement()
          ..src = youtubeEmbedUrl(videoId)
          ..style.border = 'none'
          ..style.width = '100%'
          ..style.height = '100%'
          ..allow =
              'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share'
          ..allowFullscreen = true;
      });
    }

    return HtmlElementView(viewType: viewType);
  }
}
