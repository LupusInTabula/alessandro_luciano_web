import 'package:flutter/material.dart';

import '../models/media_asset.dart';
import '../theme/app_theme.dart';

/// Displays a [MediaAsset] photo, with a "Play video" overlay button when a
/// video path is present. Actual video playback is left as a clean
/// integration point (e.g. plug in `video_player` / `chewie` later) —
/// tapping play currently opens a placeholder dialog so the UI is complete
/// and demonstrable without a video backend.
class MediaPlaceholderCard extends StatelessWidget {
  final MediaAsset media;
  final double aspectRatio;

  const MediaPlaceholderCard({
    super.key,
    required this.media,
    this.aspectRatio = 4 / 3,
  });

  void _showVideoPlaceholder(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(media.caption),
        content: Text(
          'Player video da collegare.\nPercorso previsto: ${media.videoPath}',
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: AppColors.deepBlueLight,
              child: Image.asset(
                media.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
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
                ),
              ),
            ),
            if (media.hasVideo)
              Positioned.fill(
                child: Material(
                  color: Colors.black26,
                  child: InkWell(
                    onTap: () => _showVideoPlaceholder(context),
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
