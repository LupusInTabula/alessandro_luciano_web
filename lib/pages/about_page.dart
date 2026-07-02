import 'package:flutter/material.dart';

import '../content/company_content.dart';
import '../layout/site_scaffold.dart';
import '../models/value_item.dart';
import '../theme/app_theme.dart';
import '../widgets/section_container.dart';
import '../widgets/site_footer.dart';
import '../widgets/value_card.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteScaffold(
      currentIndex: 1,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _AboutHeader(),
            SectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    CompanyContent.aboutIntroTitle,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    CompanyContent.aboutIntroBody,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    CompanyContent.aboutMissionTitle,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    CompanyContent.aboutMissionBody,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            SectionContainer(
              backgroundColor: AppColors.surface,
              child: Column(
                children: [
                  const SectionHeader(title: 'I Nostri Valori'),
                  _ValuesGrid(),
                ],
              ),
            ),
            SectionContainer(
              child: Column(
                children: [
                  const SectionHeader(title: 'La Nostra Storia nel Tempo'),
                  const _HistoryTimeline(),
                ],
              ),
            ),
            const SiteFooter(),
          ],
        ),
      ),
    );
  }
}

class _AboutHeader extends StatelessWidget {
  const _AboutHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.deepBlue,
      child: SectionContainer(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
        child: Text(
          CompanyContent.aboutPageTitle,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

class _ValuesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final columns = AppBreakpoints.isMobile(width)
        ? 1
        : AppBreakpoints.isTablet(width)
            ? 2
            : 4;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: CompanyContent.values.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        mainAxisExtent: 220,
      ),
      itemBuilder: (context, index) => ValueCard(item: CompanyContent.values[index]),
    );
  }
}

class _HistoryTimeline extends StatelessWidget {
  const _HistoryTimeline();

  @override
  Widget build(BuildContext context) {
    final milestones = CompanyContent.history;

    return Column(
      children: [
        for (int i = 0; i < milestones.length; i++)
          _TimelineTile(
            milestone: milestones[i],
            isLast: i == milestones.length - 1,
          ),
      ],
    );
  }
}

class _TimelineTile extends StatelessWidget {
  final HistoryMilestone milestone;
  final bool isLast;

  const _TimelineTile({required this.milestone, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                  color: AppColors.amber,
                  shape: BoxShape.circle,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(width: 2, color: AppColors.divider),
                ),
            ],
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    milestone.year,
                    style: const TextStyle(
                      color: AppColors.amberDark,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(milestone.title, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 6),
                  Text(milestone.description, style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
