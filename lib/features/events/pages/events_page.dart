import 'package:flutter/material.dart';
import '../widgets/events_content.dart';

/// Events page with detailed event listings
class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Events'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        bottom: true,
        child: const EventsContent(),
      ),
    );
  }
}
