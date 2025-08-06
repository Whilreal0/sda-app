import 'package:flutter/material.dart';
import '../widgets/events_content.dart';

/// Events page with detailed event listings
class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      surfaceColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Events'),
        surfaceColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: const SafeArea(
        bottom: true,
        child: EventsContent(),
      ),
    );
  }
}
