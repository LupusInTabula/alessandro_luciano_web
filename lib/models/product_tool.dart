import 'media_asset.dart';

/// Describes one of the company's patented pneumatic tools
/// (e.g. the Pliers or the Pneumatic Hammer).
class ProductTool {
  final String name;
  final String tagline;
  final String description;
  final List<String> features;
  final MediaAsset media;

  const ProductTool({
    required this.name,
    required this.tagline,
    required this.description,
    required this.features,
    required this.media,
  });
}
