import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/prayer_content.dart';

/// Detailed prayer requests page
class PrayerDetailedPage extends ConsumerWidget {
  const PrayerDetailedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Requests'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: SafeArea(
        bottom: true,
        child: const PrayerContent(),
      ),
    );
  }
} 