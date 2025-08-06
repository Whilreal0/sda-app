import 'package:flutter/material.dart';
import '../widgets/announcements_content.dart';

/// Announcements page with news and updates
class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('News & Announcements'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: SafeArea(
        bottom: true,
        child: const AnnouncementsContent(),
      ),
    );
  }
}
