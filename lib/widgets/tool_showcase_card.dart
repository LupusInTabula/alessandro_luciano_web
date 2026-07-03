import 'package:flutter/material.dart';

import '../models/product_tool.dart';
import '../theme/app_theme.dart';
import 'media_placeholder.dart';

/// Showcases a single patented pneumatic tool with photo/video on one side
/// and description/features on the other. Reverses order on request so
/// alternating rows read left-right, right-left on wide screens.
class ToolShowcaseCard extends StatelessWidget {
  final ProductTool tool;
  final bool reverse;

  const ToolShowcaseCard({super.key, required this.tool, this.reverse = false});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = AppBreakpoints.isMobile(width);

    final isYoutubeShort = tool.media.youtubeUrl != null;
    final media = isYoutubeShort
        ? Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 320),
              child: MediaPlaceholderCard(media: tool.media, aspectRatio: 9 / 16),
            ),
          )
        : MediaPlaceholderCard(media: tool.media);
    final info = _ToolInfo(tool: tool);

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [media, const SizedBox(height: 24), info],
      );
    }

    final children = [
      Expanded(child: media),
      const SizedBox(width: 48),
      Expanded(child: info),
    ];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: reverse ? children.reversed.toList() : children,
    );
  }
}

class _ToolInfo extends StatelessWidget {
  final ProductTool tool;

  const _ToolInfo({required this.tool});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.amber.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'BREVETTATO',
            style: TextStyle(
              color: AppColors.amberDark,
              fontWeight: FontWeight.w800,
              fontSize: 12,
              letterSpacing: 1,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(tool.name, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 8),
        Text(
          tool.tagline,
          style: const TextStyle(
            color: AppColors.amberDark,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 16),
        Text(tool.description, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 20),
        for (final feature in tool.features)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.check_circle, color: AppColors.deepBlue, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(feature, style: Theme.of(context).textTheme.bodyMedium),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
