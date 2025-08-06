import 'package:flutter/material.dart';
import '../widgets/announcements_content.dart';

/// Announcements page with news and updates
class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      surfaceColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('News & Announcements'),
        surfaceColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: const SafeArea(
        bottom: true,
        child: AnnouncementsContent(),
      ),
    );
  }
}
