import 'package:flutter/material.dart';
import '../../features/settings/pages/settings_page.dart';
import '../../features/donations/pages/donations_page.dart';

/// Navigation service for handling drawer navigation
class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  factory NavigationService() => _instance;
  NavigationService._internal();

  /// Navigate to settings page
  static void navigateToSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SettingsPage(),
      ),
    );
  }

  /// Navigate to donations page
  static void navigateToDonations(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DonationsPage(),
      ),
    );
  }
} 