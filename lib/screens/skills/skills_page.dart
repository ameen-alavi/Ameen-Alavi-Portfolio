/// skills_page.dart
/// Shows grouped technical skills with animated chips.
library;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widgets/animated_skill_chip.dart';

/// SkillsPage displays frontend, backend, and tools skills as animated chips.
class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final iconColor = Theme.of(context).colorScheme.primary;
    final chipTextStyle = TextStyle(fontSize: isMobile ? 12 : 14);
    final frontend = [
      {'label': 'Flutter', 'icon': FontAwesomeIcons.flutter},
      {'label': 'Dart', 'icon': FontAwesomeIcons.dartLang},
      {'label': 'HTML', 'icon': FontAwesomeIcons.html5},
      {'label': 'CSS', 'icon': FontAwesomeIcons.css3},
      {'label': 'Responsive UI', 'icon': FontAwesomeIcons.tabletScreenButton},
      {'label': 'Provider', 'icon': FontAwesomeIcons.box},
    ];
    final backend = [
      {'label': 'Python (Django)', 'icon': FontAwesomeIcons.python},
      {
        'label': 'RESTful API Integration',
        'icon': FontAwesomeIcons.networkWired,
      },
      {'label': 'MySQL', 'icon': FontAwesomeIcons.database},
      {'label': 'Firebase', 'icon': FontAwesomeIcons.fire},
      {'label': 'SQL Server', 'icon': FontAwesomeIcons.database},
    ];
    final tools = [
      {'label': 'Git & GitHub', 'icon': FontAwesomeIcons.gitAlt},
      {'label': 'Postman', 'icon': FontAwesomeIcons.paperPlane},
      {'label': 'Jira', 'icon': FontAwesomeIcons.jira},
      {'label': 'Visual Studio Code', 'icon': FontAwesomeIcons.code},
      {'label': 'Android Studio', 'icon': FontAwesomeIcons.android},
      {'label': 'Xcode', 'icon': FontAwesomeIcons.apple},
      {'label': 'State Management', 'icon': FontAwesomeIcons.cubes},
    ];
    return SingleChildScrollView(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Frontend & UI',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontSize: isMobile ? 18 : 22),
          ),
          SizedBox(height: isMobile ? 10 : 16),
          Wrap(
            spacing: isMobile ? 6 : 10,
            runSpacing: isMobile ? 6 : 10,
            children: frontend
                .asMap()
                .entries
                .map(
                  (entry) => AnimatedSkillChip(
                    icon: entry.value['icon'] as IconData,
                    label: entry.value['label'] as String,
                    iconColor: iconColor,
                    textStyle: chipTextStyle,
                    animationIndex: entry.key,
                  ),
                )
                .toList(),
          ),
          SizedBox(height: isMobile ? 18 : 28),
          Text(
            'Backend & Databases',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontSize: isMobile ? 18 : 22),
          ),
          SizedBox(height: isMobile ? 10 : 16),
          Wrap(
            spacing: isMobile ? 6 : 10,
            runSpacing: isMobile ? 6 : 10,
            children: backend
                .asMap()
                .entries
                .map(
                  (entry) => AnimatedSkillChip(
                    icon: entry.value['icon'] as IconData,
                    label: entry.value['label'] as String,
                    iconColor: iconColor,
                    textStyle: chipTextStyle,
                    animationIndex: entry.key,
                  ),
                )
                .toList(),
          ),
          SizedBox(height: isMobile ? 18 : 28),
          Text(
            'Tools & Workflow',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontSize: isMobile ? 18 : 22),
          ),
          SizedBox(height: isMobile ? 10 : 16),
          Wrap(
            spacing: isMobile ? 6 : 10,
            runSpacing: isMobile ? 6 : 10,
            children: tools
                .asMap()
                .entries
                .map(
                  (entry) => AnimatedSkillChip(
                    icon: entry.value['icon'] as IconData,
                    label: entry.value['label'] as String,
                    iconColor: iconColor,
                    textStyle: chipTextStyle,
                    animationIndex: entry.key,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
