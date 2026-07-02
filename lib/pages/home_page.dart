import 'package:flutter/material.dart';

import '../content/company_content.dart';
import '../layout/site_scaffold.dart';
import '../theme/app_theme.dart';
import '../widgets/section_container.dart';
import '../widgets/site_footer.dart';
import '../widgets/tool_showcase_card.dart';
import '../widgets/value_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteScaffold(
      currentIndex: 0,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _HeroSection(),
            SectionContainer(
              child: Column(
                children: [
                  const SectionHeader(
                    title: CompanyContent.servicesSectionTitle,
                    subtitle: CompanyContent.servicesSectionSubtitle,
                  ),
                  _ServicesGrid(),
                ],
              ),
            ),
            SectionContainer(
              backgroundColor: AppColors.surface,
              child: Column(
                children: [
                  const SectionHeader(
                    title: CompanyContent.toolsSectionTitle,
                    subtitle: CompanyContent.toolsSectionSubtitle,
                  ),
                  ToolShowcaseCard(tool: CompanyContent.pliersTool),
                  const SizedBox(height: 64),
                  ToolShowcaseCard(tool: CompanyContent.hammerTool, reverse: true),
                ],
              ),
            ),
            const _CtaBand(),
            const SiteFooter(),
          ],
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = AppBreakpoints.isMobile(width);

    final textColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          CompanyContent.heroTitle,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Colors.white,
                fontSize: isMobile ? 34 : 52,
              ),
        ),
        const SizedBox(height: 20),
        Text(
          CompanyContent.heroSubtitle,
          style: const TextStyle(color: Colors.white70, fontSize: 17, height: 1.5),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/contact'),
              child: const Text(CompanyContent.heroPrimaryCta),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text(CompanyContent.heroSecondaryCta),
            ),
          ],
        ),
      ],
    );

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.deepBlueDark, AppColors.deepBlue],
        ),
      ),
      child: SectionContainer(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: isMobile ? 56 : 96,
        ),
        child: isMobile
            ? textColumn
            : IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 6, child: textColumn),
                    const SizedBox(width: 48),
                    Expanded(
                      flex: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          CompanyContent.heroImage,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => Container(
                            color: AppColors.deepBlueLight,
                            height: 320,
                            alignment: Alignment.center,
                            child: const Icon(Icons.factory_outlined,
                                color: Colors.white38, size: 72),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _ServicesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final columns = AppBreakpoints.isMobile(width)
        ? 1
        : AppBreakpoints.isTablet(width)
            ? 2
            : 3;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: CompanyContent.services.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        mainAxisExtent: 220,
      ),
      itemBuilder: (context, index) => ValueCard(item: CompanyContent.services[index]),
    );
  }
}

class _CtaBand extends StatelessWidget {
  const _CtaBand();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.deepBlue,
      child: SectionContainer(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
        child: Column(
          children: [
            Text(
              CompanyContent.ctaTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 12),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Text(
                CompanyContent.ctaSubtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
              ),
            ),
            const SizedBox(height: 28),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/contact'),
              child: const Text(CompanyContent.ctaButton),
            ),
          ],
        ),
      ),
    );
  }
}
