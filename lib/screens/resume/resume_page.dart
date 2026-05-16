/// resume_page.dart
/// Lets users view or download the resume PDF, with platform-specific handling.
library;

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';
// Correct conditional import for web/non-web
import 'resume_helper_stub.dart'
    if (dart.library.html) 'resume_helper_web.dart';
import 'widgets/resume_action_button.dart';

/// ResumePage provides buttons to view or download the resume PDF.
class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final isTablet =
            constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
        final maxContentWidth = isMobile ? double.infinity : 500.0;
        final padding = isMobile
            ? const EdgeInsets.all(16.0)
            : isTablet
            ? const EdgeInsets.all(32.0)
            : const EdgeInsets.symmetric(vertical: 48.0, horizontal: 0);
        return Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: maxContentWidth),
            padding: padding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.picture_as_pdf,
                  size: isMobile ? 40 : 64,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(height: isMobile ? 16 : 24),
                Text(
                  'My Resume',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 20 : null,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: isMobile ? 10 : 16),
                Text(
                  'Click below to view or download my resume (PDF).',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: isMobile ? 13 : null,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: isMobile ? 20 : 32),
                ResumeActionButton(
                  icon: Icons.open_in_new,
                  label: 'View Resume',
                  onPressed: () async {
                    if (kIsWeb) {
                      openPdfInNewTab('assets/Ameen_Alavi_Resume1.pdf');
                    } else {
                      final url =
                          'https://ameen-alavi.github.io/Ameen-Alavi-Portfolio/assets/Ameen_Alavi_Resume1.pdf';
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(
                          Uri.parse(url),
                          mode: LaunchMode.externalApplication,
                        );
                        if (!context.mounted) return;
                      } else {
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Could not open resume.'),
                          ),
                        );
                      }
                    }
                  },
                ),
                SizedBox(height: isMobile ? 10 : 16),
                ResumeActionButton(
                  icon: Icons.download,
                  label: 'Download Resume',
                  onPressed: () async {
                    if (kIsWeb) {
                      downloadPdf(
                        'assets/Ameen_Alavi_Resume1.pdf',
                        'Ameen_Alavi_Resume1.pdf',
                      );
                    } else {
                      final url =
                          'https://ameen-alavi.github.io/Ameen-Alavi-Portfolio/assets/Ameen_Alavi_Resume1.pdf';
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(
                          Uri.parse(url),
                          mode: LaunchMode.externalApplication,
                        );
                        if (!context.mounted) return;
                      } else {
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Could not download resume.'),
                          ),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
