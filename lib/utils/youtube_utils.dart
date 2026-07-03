/// Extracts the video ID from common YouTube URL formats:
/// - https://www.youtube.com/watch?v=ID
/// - https://youtu.be/ID
/// - https://youtube.com/shorts/ID
String? extractYoutubeId(String url) {
  final uri = Uri.tryParse(url);
  if (uri == null) return null;

  if (uri.host.contains('youtu.be')) {
    return uri.pathSegments.isNotEmpty ? uri.pathSegments.first : null;
  }

  final shortsIndex = uri.pathSegments.indexOf('shorts');
  if (shortsIndex != -1 && shortsIndex + 1 < uri.pathSegments.length) {
    return uri.pathSegments[shortsIndex + 1];
  }

  return uri.queryParameters['v'];
}

String youtubeThumbnailUrl(String videoId) =>
    'https://img.youtube.com/vi/$videoId/hqdefault.jpg';

String youtubeEmbedUrl(String videoId) =>
    'https://www.youtube-nocookie.com/embed/$videoId?rel=0&modestbranding=1';
