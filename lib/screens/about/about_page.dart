/// about_page.dart
/// Displays the About Me section and career highlights.
library;

import 'package:flutter/material.dart';

/// AboutPage shows the full About Me profile content.
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: textTheme.headlineLarge,
          ),

          const SizedBox(height: 30),

          Text(
            'I am a Software Engineer and MCA student with a strong foundation in building cross-platform mobile applications using Flutter, combined with backend development using Django.',
            style: textTheme.bodyLarge,
          ),

          const SizedBox(height: 8),

          Text(
            'I have contributed to real-world health-tech and e-commerce projects, with experience in UI development, RESTful API integration, backend functionality, cross-platform testing, and deployment. I am passionate about writing clean, scalable code and creating seamless user experiences.',
            style: textTheme.bodyLarge,
          ),

          const SizedBox(height: 25),

          Text(
            'Work Experience',
            style: textTheme.headlineSmall,
          ),

          const SizedBox(height: 12),

          Text(
            'Software Engineer – SOXO (Dec 2024 – May 2025)',
            style: textTheme.titleMedium,
          ),

          const SizedBox(height: 8),

          Text(
            'Worked in a product-based health-tech company focused on building mobile applications with Flutter. Responsible for API integration, UI development, cross-platform testing, and collaborating with backend and design teams in an agile environment.',
            style: textTheme.bodyLarge,
          ),

          const SizedBox(height: 32),

          Text(
            'Education',
            style: textTheme.headlineSmall,
          ),

          const SizedBox(height: 12),

          Text(
            'Master of Computer Applications (MCA)',
            style: textTheme.titleMedium,
          ),

          const SizedBox(height: 8),

          Text(
            'Currently pursuing my MCA, strengthening my knowledge in software engineering, application development, databases, and modern technologies through academic and practical projects.',
            style: textTheme.bodyLarge,
          ),

          const SizedBox(height: 32),

          Text(
            'Certifications & Training',
            style: textTheme.headlineSmall,
          ),

          const SizedBox(height: 12),

          Text(
            'Mobile App Development with Flutter & Django – FINEDGE (May 2024 – Nov 2024)',
            style: textTheme.titleMedium,
          ),

          const SizedBox(height: 8),

          Text(
            'Completed extensive training covering cross-platform UI design with Flutter, backend development using Django, user authentication, database management, and deploying full-stack mobile applications.',
            style: textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}