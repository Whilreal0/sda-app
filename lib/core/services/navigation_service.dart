import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../../features/settings/widgets/settings_content.dart';
import '../../features/donations/widgets/donations_content.dart';

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
        builder: (context) => Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            title: const Text('Settings'),
            backgroundColor: AppColors.surface,
            elevation: 0,
            automaticallyImplyLeading: true,
            iconTheme: const IconThemeData(
              color: AppColors.primary,
              size: 24,
            ),
            titleTextStyle: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          body: const SettingsContent(),
        ),
      ),
    );
  }

  /// Navigate to donations page
  static void navigateToDonations(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            title: const Text('Donations'),
            backgroundColor: AppColors.surface,
            elevation: 0,
            automaticallyImplyLeading: true,
            iconTheme: const IconThemeData(
              color: AppColors.primary,
              size: 24,
            ),
            titleTextStyle: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          body: const DonationsContent(),
        ),
      ),
    );
  }
} 