import 'package:flutter/material.dart';

import '../models/value_item.dart';
import '../theme/app_theme.dart';

class ValueCard extends StatelessWidget {
  final ValueItem item;

  const ValueCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.amber.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(item.icon, color: AppColors.amberDark, size: 28),
          ),
          const SizedBox(height: 16),
          Text(item.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(item.description, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
