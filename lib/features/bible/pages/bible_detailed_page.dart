import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/bible_content.dart';

/// Detailed bible study page
class BibleDetailedPage extends ConsumerWidget {
  const BibleDetailedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bible Study'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: SafeArea(
        bottom: true,
        child: const BibleContent(),
      ),
    );
  }
} 