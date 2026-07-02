import 'package:flutter/material.dart';

import 'content/company_content.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'pages/home_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const AlessandroLucianoApp());
}

class AlessandroLucianoApp extends StatelessWidget {
  const AlessandroLucianoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: CompanyContent.companyName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/contact': (context) => const ContactPage(),
      },
    );
  }
}
