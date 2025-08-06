import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/bible_content.dart';

/// Bible study page with Riverpod state management
class BiblePage extends ConsumerWidget {
  const BiblePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bible Study'),
      ),
      body: const BibleContent(),
    );
  }
} 