/// Application-wide constants
class AppConstants {
  // App Information
  static const String appName = 'SDA App';
  static const String appVersion = '1.0.0';
  
  // Navigation
  static const int defaultNavigationIndex = 0;
  static const int navigationTabCount = 4;
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 12.0;
  static const double iconSize = 80.0;
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
  
  // Text Styles
  static const double headlineTextSize = 24.0;
  static const double bodyTextSize = 16.0;
  static const double captionTextSize = 12.0;
}

/// Navigation tab information
class NavigationConstants {
  static const List<NavigationTabInfo> tabs = [
    NavigationTabInfo(
      index: 0,
      label: 'Home',
      icon: 'home_outlined',
      activeIcon: 'home',
    ),
    NavigationTabInfo(
      index: 1,
      label: 'Live',
      icon: 'live_tv_outlined',
      activeIcon: 'live_tv',
    ),
    NavigationTabInfo(
      index: 2,
      label: 'News',
      icon: 'article_outlined',
      activeIcon: 'article',
    ),
    NavigationTabInfo(
      index: 3,
      label: 'Events',
      icon: 'event_outlined',
      activeIcon: 'event',
    ),
  ];
}

/// Navigation tab information model
class NavigationTabInfo {
  const NavigationTabInfo({
    required this.index,
    required this.label,
    required this.icon,
    required this.activeIcon,
  });

  final int index;
  final String label;
  final String icon;
  final String activeIcon;
}
