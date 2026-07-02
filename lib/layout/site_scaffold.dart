import 'package:flutter/material.dart';

import '../content/company_content.dart';
import '../theme/app_theme.dart';

/// Shared responsive scaffold used by every page of the site.
///
/// - On desktop/tablet: shows a horizontal nav bar with text buttons.
/// - On mobile: collapses navigation into a Drawer opened via a hamburger icon.
class SiteScaffold extends StatelessWidget {
  final int currentIndex;
  final Widget body;

  const SiteScaffold({
    super.key,
    required this.currentIndex,
    required this.body,
  });

  static const List<String> _routes = ['/', '/about', '/contact'];

  void _navigate(BuildContext context, int index) {
    if (index == currentIndex) return;
    Navigator.of(context).pushReplacementNamed(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = AppBreakpoints.isDesktop(width);

    return Scaffold(
      appBar: _SiteAppBar(
        currentIndex: currentIndex,
        showInlineNav: isDesktop,
        onNavTap: (i) => _navigate(context, i),
      ),
      drawer: isDesktop
          ? null
          : _SiteDrawer(
              currentIndex: currentIndex,
              onNavTap: (i) {
                Navigator.of(context).pop();
                _navigate(context, i);
              },
            ),
      body: body,
    );
  }
}

class _SiteAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;
  final bool showInlineNav;
  final ValueChanged<int> onNavTap;

  const _SiteAppBar({
    required this.currentIndex,
    required this.showInlineNav,
    required this.onNavTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 72,
      titleSpacing: 16,
      title: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              CompanyContent.logoCompact,
              height: 44,
              fit: BoxFit.contain,
              errorBuilder: (_, _, _) => const Icon(Icons.factory_outlined, color: Colors.white, size: 36),
            ),
          ),
          const SizedBox(width: 12),
          if (showInlineNav || MediaQuery.of(context).size.width > 420)
            Flexible(
              child: Text(
                CompanyContent.companyName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
      actions: showInlineNav
          ? [
              for (int i = 0; i < CompanyContent.navLabels.length; i++)
                _NavButton(
                  label: CompanyContent.navLabels[i],
                  selected: i == currentIndex,
                  onTap: () => onNavTap(i),
                ),
              const SizedBox(width: 24),
            ]
          : null,
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: selected ? AppColors.amber : Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          fontSize: 15,
        ),
      ),
    );
  }
}

class _SiteDrawer extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onNavTap;

  const _SiteDrawer({required this.currentIndex, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.deepBlue,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Image.asset(
                CompanyContent.logoCompact,
                height: 56,
                fit: BoxFit.contain,
                errorBuilder: (_, _, _) => const Icon(Icons.factory_outlined, color: Colors.white, size: 48),
              ),
            ),
            const Divider(color: Colors.white24, height: 1),
            for (int i = 0; i < CompanyContent.navLabels.length; i++)
              ListTile(
                title: Text(
                  CompanyContent.navLabels[i],
                  style: TextStyle(
                    color: i == currentIndex ? AppColors.amber : Colors.white,
                    fontWeight: i == currentIndex ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
                onTap: () => onNavTap(i),
              ),
          ],
        ),
      ),
    );
  }
}
