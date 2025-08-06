import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/navigation_provider.dart';
import '../../home/widgets/home_content.dart';
import '../../facebook_live/widgets/facebook_live_content.dart';
import '../../announcements/widgets/announcements_content.dart';
import '../../events/widgets/events_content.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/side_drawer.dart';
import '../../../core/constants/app_constants.dart';

/// Main screen that manages navigation between different pages
class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationNotifierProvider);

    // List of page contents corresponding to navigation tabs
    const List<Widget> pageContents = [
      HomeContent(),
      FacebookLiveContent(),
      AnnouncementsContent(),
      EventsContent(),
    ];

    // List of page titles
    const List<String> pageTitles = [
      'Home',
      'Live Stream',
      'News & Announcements',
      'Events',
    ];

    return Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(
        title: Text(pageTitles[selectedIndex]),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        automaticallyImplyLeading: true,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: AppConstants.headlineTextSize,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onSurface,
          size: 24,
        ),
        toolbarHeight: 64,
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: pageContents,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
