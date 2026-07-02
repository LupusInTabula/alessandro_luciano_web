import 'package:flutter/material.dart';

/// A short "value" or "strength" bullet used on the About page
/// (e.g. Precision, Reliability, Experience).
class ValueItem {
  final IconData icon;
  final String title;
  final String description;

  const ValueItem({
    required this.icon,
    required this.title,
    required this.description,
  });
}

/// A single milestone in the company's history timeline.
class HistoryMilestone {
  final String year;
  final String title;
  final String description;

  const HistoryMilestone({
    required this.year,
    required this.title,
    required this.description,
  });
}
