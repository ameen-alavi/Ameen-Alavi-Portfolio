/// about_page.dart
/// Displays the About Me section with animated text and career highlights.
library;

import 'package:flutter/material.dart';

/// AboutPage shows a step-based animated introduction and experience.
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int _step = 0;

  void _nextStep() {
    setState(() {
      _step++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About Me', style: textTheme.headlineLarge),
          const SizedBox(height: 30),
          Text(
            'I am a Software Engineer with a strong foundation in building cross-platform mobile applications using Flutter, combined with backend development using Django.',
            style: textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'With 6 months of professional experience, I’ve contributed to real-world health-tech and e-commerce projects. My role spanned full-stack responsibilities — from designing intuitive UI and integrating RESTful APIs to managing backend logic and deployment. I’m passionate about writing clean, scalable code and delivering seamless user experiences.',
            style: textTheme.bodyLarge,
          ),
          const SizedBox(height: 25),
          Text('Work Experience', style: textTheme.headlineSmall),
          const SizedBox(height: 12),
          Text(
            'Software Engineer – SOXO (Dec 2024 – May 2025)',
            style: textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Worked in a product-based health tech company focused on building mobile apps with Flutter. Responsible for API integration, UI development, cross-platform testing, and collaborating with backend and design teams in an agile environment.',
            style: textTheme.bodyLarge,
          ),
          const SizedBox(height: 32),
          Text('Certifications', style: textTheme.headlineSmall),
          const SizedBox(height: 12),
          Text(
            'Mobile App Development with Flutter & Django – FINEDGE (May 2024 – Nov 2024)',
            style: textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Completed extensive training covering cross-platform UI design with Flutter, backend development using Django, user authentication, database management, and deploying full-stack mobile apps.',
            style: textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
