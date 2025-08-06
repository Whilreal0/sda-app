import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/services/navigation_service.dart';

/// Side drawer widget for navigation
class SideDrawer extends ConsumerWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: Column(
        children: [
          _buildDrawerHeader(context),
          Expanded(
            child: _buildDrawerItems(context),
          ),
        ],
      ),
    );
  }

  /// Build the drawer header with app information
  Widget _buildDrawerHeader(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.9),
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.8),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Icons.church,
              size: 32,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            AppConstants.appName,
            style: TextStyle(
              color: Theme.of(context).colorScheme.surface,
              fontSize: AppConstants.headlineTextSize,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  offset: const Offset(0, 1),
                  blurRadius: 2,
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Version ${AppConstants.appVersion}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.9),
              fontSize: AppConstants.captionTextSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  /// Build the drawer menu items
  Widget _buildDrawerItems(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildDrawerItem(
          context,
          icon: Icons.volunteer_activism_outlined,
          title: 'Donations',
          onTap: () {
            Navigator.pop(context);
            NavigationService.navigateToDonations(context);
          },
        ),
        _buildDrawerItem(
          context,
          icon: Icons.settings_outlined,
          title: 'Settings',
          onTap: () {
            Navigator.pop(context);
            NavigationService.navigateToSettings(context);
          },
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          height: 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
                Colors.transparent,
              ],
            ),
          ),
        ),
        _buildDrawerItem(
          context,
          icon: Icons.info_outline,
          title: 'About',
          onTap: () {
            Navigator.pop(context);
            // Show about dialog
            _showAboutDialog(context);
          },
        ),
        _buildDrawerItem(
          context,
          icon: Icons.help_outline,
          title: 'Help & Support',
          onTap: () {
            Navigator.pop(context);
            // Navigate to help page or show help dialog
            _showHelpDialog(context);
          },
        ),
      ],
    );
  }

  /// Build individual drawer item
  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: AppConstants.bodyTextSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  /// Show about dialog
  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: AppConstants.appName,
      applicationVersion: AppConstants.appVersion,
      applicationIcon: Icon(
        Icons.church,
        size: 50,
        color: Theme.of(context).colorScheme.primary,
      ),
      children: [
        const Text(
          'A comprehensive app for the Seventh-day Adventist community, providing access to services, events, and spiritual resources.',
        ),
      ],
    );
  }

  /// Show help dialog
  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Help & Support'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Need help? Here are some options:'),
            SizedBox(height: 16),
            Text('• Contact your local church office'),
            Text('• Email support: support@sda-app.com'),
            Text('• Call: 1-800-SDA-HELP'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
} 