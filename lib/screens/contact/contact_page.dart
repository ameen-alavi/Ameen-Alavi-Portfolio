/// contact_page.dart
/// Provides contact information and social links.
///
/// ContactPage shows email, LinkedIn, and GitHub with icons and selectable text.
library;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widgets/contact_info_row.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final iconColor = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Contact Me', style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 24),
          ContactInfoRow(
            icon: FontAwesomeIcons.phone,
            iconSize: 16,
            text: '+91 735 624 5030',
            iconColor: iconColor,
          ),
          const SizedBox(height: 16),
          ContactInfoRow(
            icon: Icons.email,
            iconSize: 16,

            text: 'ameenalavi30@gmail.com',
            iconColor: iconColor,
          ),
          const SizedBox(height: 16),
          ContactInfoRow(
            icon: FontAwesomeIcons.linkedin,
            iconSize: 16,

            text: 'linkedin.com/in/ameen-alavi',
            iconColor: iconColor,
          ),
          const SizedBox(height: 16),
          ContactInfoRow(
            icon: FontAwesomeIcons.github,
            iconSize: 16,

            text: 'github.com/ameen-77',
            iconColor: iconColor,
          ),
        ],
      ),
    );
  }
}
