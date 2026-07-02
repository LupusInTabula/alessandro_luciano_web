/// A simple, self-explanatory model describing a piece of media
/// (photo or video) used throughout the site.
///
/// Keeping media references as data (instead of scattering asset
/// path strings across widgets) makes it trivial to swap in real
/// photos/videos later by editing only [CompanyContent].
class MediaAsset {
  final String imagePath;
  final String? videoPath;
  final String caption;

  const MediaAsset({
    required this.imagePath,
    required this.caption,
    this.videoPath,
  });

  bool get hasVideo => videoPath != null && videoPath!.isNotEmpty;
}
