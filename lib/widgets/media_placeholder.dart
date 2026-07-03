import 'package:flutter/material.dart';

import '../models/media_asset.dart';
import '../theme/app_theme.dart';
import '../utils/youtube_utils.dart';
import 'youtube_iframe_view.dart';

/// Displays a [MediaAsset] photo, with a "Play video" overlay button when a
/// video is present. YouTube videos (via [MediaAsset.youtubeUrl]) play
/// inline once tapped. A legacy local [MediaAsset.videoPath] falls back to
/// an informational dialog, as a clean integration point for a future
/// self-hosted player.
class MediaPlaceholderCard extends StatefulWidget {
  final MediaAsset media;
  final double aspectRatio;

  const MediaPlaceholderCard({
    super.key,
    required this.media,
    this.aspectRatio = 4 / 3,
  });

  @override
  State<MediaPlaceholderCard> createState() => _MediaPlaceholderCardState();
}

class _MediaPlaceholderCardState extends State<MediaPlaceholderCard> {
  bool _playing = false;

  String? get _youtubeId {
    final url = widget.media.youtubeUrl;
    return url == null ? null : extractYoutubeId(url);
  }

  void _showLegacyVideoPlaceholder() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(widget.media.caption),
        content: Text(
          'Player video da collegare.\nPercorso previsto: ${widget.media.videoPath}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Chiudi'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = widget.media;
    final youtubeId = _youtubeId;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: widget.aspectRatio,
        child: (_playing && youtubeId != null)
            ? YoutubeIframeView(videoId: youtubeId)
            : Stack(
                fit: StackFit.expand,
                children: [
                  _Thumbnail(media: media, youtubeId: youtubeId),
                  if (media.hasVideo)
                    Positioned.fill(
                      child: Material(
                        color: Colors.black26,
                        child: InkWell(
                          onTap: () {
                            if (youtubeId != null) {
                              setState(() => _playing = true);
                            } else {
                              _showLegacyVideoPlaceholder();
                            }
                          },
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.all(18),
                              decoration: const BoxDecoration(
                                color: AppColors.amber,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.play_arrow_rounded,
                                  color: AppColors.deepBlue, size: 36),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}

class _Thumbnail extends StatelessWidget {
  final MediaAsset media;
  final String? youtubeId;

  const _Thumbnail({required this.media, required this.youtubeId});

  Widget _errorFallback() {
    return Container(
      color: AppColors.deepBlueLight,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.photo_camera_back_outlined,
              color: Colors.white70, size: 48),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              media.caption,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (youtubeId != null) {
      return Image.network(
        youtubeThumbnailUrl(youtubeId!),
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => _errorFallback(),
      );
    }

    return Image.asset(
      media.imagePath,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) => _errorFallback(),
    );
  }
}
