import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/navigation_provider.dart';
import '../../../core/constants/app_constants.dart';

/// Custom bottom navigation bar widget with Riverpod state management
class CustomBottomNavigationBar extends ConsumerWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationNotifierProvider);
    final navigationNotifier = ref.read(navigationNotifierProvider.notifier);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: navigationNotifier.updateIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.outline,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: AppConstants.captionTextSize,
          color: Theme.of(context).colorScheme.primary,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: AppConstants.captionTextSize,
          color: Theme.of(context).colorScheme.outline,
        ),
        elevation: 0,
        surfaceColor: Theme.of(context).colorScheme.surface,
        items: _buildNavigationItems(),
      ),
    );
  }

  /// Build navigation bar items from constants
  List<BottomNavigationBarItem> _buildNavigationItems() {
    return NavigationConstants.tabs.map((tab) {
      return BottomNavigationBarItem(
        icon: _getIcon(tab.icon),
        activeIcon: _getIcon(tab.activeIcon),
        label: tab.label,
      );
    }).toList();
  }

  /// Get icon widget from icon name
  Widget _getIcon(String iconName) {
    switch (iconName) {
      case 'home_outlined':
        return const Icon(Icons.home_outlined);
      case 'home':
        return const Icon(Icons.home);
      case 'event_outlined':
        return const Icon(Icons.event_outlined);
      case 'event':
        return const Icon(Icons.event);
      case 'article_outlined':
        return const Icon(Icons.article_outlined);
      case 'article':
        return const Icon(Icons.article);
      case 'campaign_outlined':
        return const Icon(Icons.campaign_outlined);
      case 'campaign':
        return const Icon(Icons.campaign);
      case 'prayer_times_outlined':
        return const Icon(Icons.favorite_outline);
      case 'prayer_times':
        return const Icon(Icons.favorite);
      case 'menu_book_outlined':
        return const Icon(Icons.menu_book_outlined);
      case 'menu_book':
        return const Icon(Icons.menu_book);
      case 'volunteer_activism_outlined':
        return const Icon(Icons.volunteer_activism_outlined);
      case 'volunteer_activism':
        return const Icon(Icons.volunteer_activism);
      case 'live_tv_outlined':
        return const Icon(Icons.live_tv_outlined);
      case 'live_tv':
        return const Icon(Icons.live_tv);
      case 'settings_outlined':
        return const Icon(Icons.settings_outlined);
      case 'settings':
        return const Icon(Icons.settings);
      default:
        return const Icon(Icons.help_outline);
    }
  }
}
