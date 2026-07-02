import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Wraps page content with consistent max-width, padding and background,
/// so every section on every page shares the same responsive rhythm.
class SectionContainer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  const SectionContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = AppBreakpoints.isMobile(width)
        ? 20.0
        : AppBreakpoints.isTablet(width)
            ? 40.0
            : 80.0;

    return Container(
      width: double.infinity,
      color: backgroundColor ?? Colors.transparent,
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: AppBreakpoints.isMobile(width) ? 40 : 72,
          ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      ),
    );
  }
}

/// Section eyebrow + title + subtitle header, centered.
class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const SectionHeader({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
        const SizedBox(height: 40),
      ],
    );
  }
}
