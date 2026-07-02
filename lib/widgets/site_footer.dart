import 'package:flutter/material.dart';

import '../content/company_content.dart';
import '../theme/app_theme.dart';
import 'section_container.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.deepBlueDark,
      child: SectionContainer(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: 12,
          children: [
            Text(
              CompanyContent.footerCopyright(2026),
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
            Text(
              '${CompanyContent.companyEmail}  ·  ${CompanyContent.companyPhone}',
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
