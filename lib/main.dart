/// main.dart
/// Entry point for the Ameen Alavi Portfolio Flutter app.
/// Sets up theming, routing, and the main tab navigation.
library;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'screens/about/about_page.dart';
import 'screens/contact/contact_page.dart';
import 'screens/projects/projects_page.dart';
import 'screens/skills/skills_page.dart';
import 'screens/resume/resume_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  // Set default theme to dark if not set
  final isDarkMode = prefs.getBool('isDarkMode');
  runApp(
    DevFolioApp(
      initialThemeMode: (isDarkMode == null || isDarkMode)
          ? ThemeMode.dark
          : ThemeMode.light,
    ),
  );
}

/// The root widget for the portfolio app.
/// Handles theme switching and initializes the home page.
class DevFolioApp extends StatefulWidget {
  final ThemeMode initialThemeMode;
  const DevFolioApp({super.key, required this.initialThemeMode});

  @override
  State<DevFolioApp> createState() => _DevFolioAppState();
}

class _DevFolioAppState extends State<DevFolioApp> {
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    _themeMode = widget.initialThemeMode;
  }

  void _toggleTheme() async {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _themeMode == ThemeMode.dark);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ameen Alavi - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      ),
      themeMode: _themeMode,
      home: HomePage(toggleTheme: _toggleTheme),
    );
  }
}

/// The main home page with tab navigation for all portfolio sections.
class HomePage extends StatelessWidget {
  final VoidCallback toggleTheme;
  const HomePage({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                Theme.of(context).brightness == Brightness.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
              onPressed: toggleTheme,
            ),
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'About'),
              Tab(text: 'Projects'),
              Tab(text: 'Skills'),
              Tab(text: 'Contact'),
              Tab(text: 'Resume'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HomeContent(),
            AboutPage(),
            ProjectsPage(),
            SkillsPage(),
            ContactPage(),
            ResumePage(),
          ],
        ),
        bottomNavigationBar: FooterWidget(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      width: double.infinity,
      child: isMobile
          ? _buildMobileLayout(context)
          : _buildDesktopLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    final textColor =
        Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "WELCOME TO MY PORTFOLIO 👋",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: textColor.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 20),
              // Animated name using AnimatedTextKit
              SizedBox(
                height: 60,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Ameen',
                      textStyle: GoogleFonts.poppins(
                        fontSize: 52,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                      speed: const Duration(milliseconds: 120),
                      cursor: '',
                    ),
                  ],
                  repeatForever: true,
                  pause: const Duration(milliseconds: 500),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ),
              SizedBox(
                height: 60,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Alavi',
                      textStyle: GoogleFonts.poppins(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                      speed: const Duration(milliseconds: 120),
                      cursor: '',
                    ),
                  ],
                  repeatForever: true,
                  pause: const Duration(milliseconds: 500),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Software Engineer",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.deepPurpleAccent.shade100,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: Image.asset(
                'assets/images/profile.jpeg',
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    final textColor =
        Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;

    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(300),
          child: Image.asset(
            'assets/images/profile.jpeg',
            width: 180,
            height: 180,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "WELCOME TO MY PORTFOLIO 👋",
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: textColor.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 60,
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Ameen Alavi',
                textStyle: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
                speed: const Duration(milliseconds: 120),
                cursor: '',
              ),
            ],
            repeatForever: true,
            pause: const Duration(milliseconds: 500),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
        ),
        Text(
          "Software Engineer",
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.deepPurpleAccent.shade100,
          ),
        ),
      ],
    );
  }
}

// FooterWidget for copyright and links
class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor =
        Theme.of(context).textTheme.bodySmall?.color ?? Colors.grey;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(height: 1, color: Colors.grey.withValues(alpha: 0.2)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.github, size: 18),
                color: textColor,
                tooltip: 'GitHub',
                onPressed: () {
                  launchUrl(Uri.parse('https://github.com/ameen-77'));
                },
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.linkedin, size: 18),
                color: textColor,
                tooltip: 'LinkedIn',
                onPressed: () {
                  launchUrl(Uri.parse('https://linkedin.com/in/ameen-alavi'));
                },
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '© 2025 Ameen Alavi. All rights reserved.',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: textColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            'Built with Flutter',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: textColor.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
