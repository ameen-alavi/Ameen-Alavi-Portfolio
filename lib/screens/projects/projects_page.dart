/// projects_page.dart
/// Lists and animates the user's featured projects.

library;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widgets/project_card.dart';

/// ProjectsPage displays a list of projects with fade-in animations.
class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    // This line ensures the widget rebuilds on theme change.
    final brightness = Theme.of(context).brightness;

    // Use brightness to avoid unused variable warning.
    // ignore: unused_local_variable
    final _ = brightness;

    final List<Map<String, Object>> projects = [
      {
        'icon': FontAwesomeIcons.utensils,
        'title': 'SplitBite',
        'description':
            'A smart food ordering application developed as an MCA project using Flutter and Django.\n'
            '• Individual & group food ordering\n'
            '• Automatic bill splitting\n'
            '• Scheduled delivery & pickup\n'
            '• Restaurant and admin management\n'
            '• Customer wallet & order tracking',
      },
      {
        'icon': FontAwesomeIcons.listCheck,
        'title': 'DayForge',
        'description':
            'A habit and task management application designed to help users organize daily routines and build consistent habits.\n'
            '• Flutter & Provider\n'
            '• SQLite local database\n'
            '• Habit and task tracking\n'
            '• Dark & light themes\n'
            '• Responsive and clean UI',
      },
      {
        'icon': FontAwesomeIcons.heartPulse,
        'title': 'NURA App',
        'description':
            'Contributed to a health-tech screening application that allows users to view reports, grade summaries, and book screenings.\n'
            '• Integrated REST APIs\n'
            '• Designed intuitive UI\n'
            '• Cross-platform development\n'
            '• Testing and bug fixing',
      },
      {
        'icon': FontAwesomeIcons.comments,
        'title': 'NURA Insider',
        'description':
            'Contributed to a professional communication application for radiographers and radiologists.\n'
            '• Role-based login\n'
            '• Chat and media sharing\n'
            '• Case submission\n'
            '• Built chat UI and managed application state',
      },
      {
        'icon': FontAwesomeIcons.qrcode,
        'title': 'OneDesk',
        'description':
            'A guest check-in and check-out solution using QR wristbands with real-time tracking.\n'
            '• Designed application UI\n'
            '• Integrated REST APIs\n'
            '• Guest and room management\n'
            '• Manual entry and real-time status updates',
      },
      {
        'icon': FontAwesomeIcons.cartShopping,
        'title': 'E-Commerce App',
        'description':
            'A full-stack e-commerce application built with Flutter, Django, and SQL Server.\n'
            '• Product browsing and cart\n'
            '• Authentication\n'
            '• Order management\n'
            '• Backend API integration\n'
            '• Database management',
      },
      {
        'icon': FontAwesomeIcons.laptopCode,
        'title': 'Developer Portfolio',
        'description':
            'A personal developer portfolio built using Flutter Web to showcase my experience, skills, and projects.\n'
            '• Responsive UI\n'
            '• Dark & light themes\n'
            '• Animated project cards\n'
            '• Custom navigation',
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];

          return ProjectCard(
            icon: project['icon'] as IconData,
            title: project['title'] as String,
            description: project['description'] as String,
            animationIndex: index,
          );
        },
      ),
    );
  }
}
