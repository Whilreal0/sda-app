import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/services/navigation_service.dart';

/// Side drawer widget for navigation
class SideDrawer extends ConsumerWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.zero,
          bottomRight: Radius.zero,
        ),
      ),
      child: SafeArea(
        bottom: true,
        child: Column(
          children: [
            _buildDrawerHeader(context),
            Expanded(
              child: _buildDrawerItems(context),
            ),
            _buildDrawerFooter(context),
          ],
        ),
      ),
    );
  }

  /// Build the drawer header with app information
  Widget _buildDrawerHeader(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.church,
            size: 48,
            color: AppColors.surface,
          ),
          const SizedBox(height: 12),
          Text(
            'SDA App',
            style: TextStyle(
              color: AppColors.surface,
              fontSize: 24,
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
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                AppColors.borderLight,
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
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: AppConstants.bodyTextSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  /// Show about dialog
  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: AppConstants.appName,
      applicationVersion: AppConstants.appVersion,
      applicationIcon: const Icon(
        Icons.church,
        size: 50,
        color: AppColors.primary,
      ),
      children: [
        const Text(
          'A comprehensive app for the Seventh-day Adventist community, providing access to services, events, and spiritual resources.',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  /// Show help dialog
  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text(
          'Help & Support',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Need help? Here are some options:',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16),
            _HelpOption(
              icon: Icons.phone,
              text: 'Contact your local church office',
            ),
            SizedBox(height: 8),
            _HelpOption(
              icon: Icons.email,
              text: 'Email support: support@sda-app.com',
            ),
            SizedBox(height: 8),
            _HelpOption(
              icon: Icons.phone_in_talk,
              text: 'Call: 1-800-SDA-HELP',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Close',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build the drawer footer with app title
  Widget _buildDrawerFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.05),
        border: const Border(
          top: BorderSide(
            color: AppColors.borderLight,
            width: 1,
          ),
        ),
      ),
      child: const Column(
        children: [
          Text(
            'SDA App',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Seventh-day Adventist Community',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Help option widget
class _HelpOption extends StatelessWidget {
  final IconData icon;
  final String text;

  const _HelpOption({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: AppColors.primary,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
} 