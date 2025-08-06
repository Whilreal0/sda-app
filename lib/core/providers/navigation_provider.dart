import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_provider.g.dart';

/// Navigation state provider for bottom navigation bar
@riverpod
class NavigationNotifier extends _$NavigationNotifier {
  @override
  int build() => 0; // Default to Home tab (index 0)

  /// Update the selected navigation index
  void updateIndex(int index) {
    if (index >= 0 && index < 5) {
      state = index;
    }
  }

  /// Navigate to specific tab by name
  void navigateToHome() => updateIndex(0);
  void navigateToEvents() => updateIndex(1);
  void navigateToAnnouncements() => updateIndex(2);
  void navigateToDonations() => updateIndex(3);
  void navigateToSettings() => updateIndex(4);
}

/// Enum for navigation tabs
enum NavigationTab {
  home(0, 'Home'),
  events(1, 'Events'),
  announcements(2, 'News'),
  donations(3, 'Donations'),
  settings(4, 'Settings');

  const NavigationTab(this.tabIndex, this.label);

  final int tabIndex;
  final String label;
}
