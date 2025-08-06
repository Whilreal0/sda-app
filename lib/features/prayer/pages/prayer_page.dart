import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/prayer_content.dart';

/// Prayer requests page with Riverpod state management
class PrayerPage extends ConsumerWidget {
  const PrayerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Requests'),
      ),
      body: const PrayerContent(),
    );
  }
} 