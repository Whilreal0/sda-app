import 'package:flutter/material.dart';
import '../widgets/home_content.dart';
import '../../events/pages/events_page.dart';
import '../../announcements/pages/announcements_page.dart';

/// Home page with church dashboard
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        actions: [
          // Events Button
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EventsPage(),
                ),
              );
            },
            icon: const Icon(Icons.event),
            tooltip: 'Events',
          ),
          // News Button
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AnnouncementsPage(),
                ),
              );
            },
            icon: const Icon(Icons.campaign),
            tooltip: 'News & Announcements',
          ),
        ],
      ),
      body: const HomeContent(),
    );
  }
}
