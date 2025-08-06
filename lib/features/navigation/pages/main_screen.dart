import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/navigation_provider.dart';
import '../../home/pages/home_page.dart';
import '../../facebook_live/pages/facebook_live_page.dart';
import '../../donations/pages/donations_page.dart';
import '../../settings/pages/settings_page.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

/// Main screen that manages navigation between different pages
class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationNotifierProvider);

    // List of pages corresponding to navigation tabs
    const List<Widget> pages = [
      HomePage(),
      FacebookVideoView(),
      DonationsPage(),
      SettingsPage(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
