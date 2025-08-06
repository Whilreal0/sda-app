import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

/// Settings page content widget
class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Section
          _buildSectionHeader(context, 'Profile', Icons.person),
          const SizedBox(height: 8),
          _buildSettingsCard(
            context,
            children: [
              _buildSettingsTile(
                context,
                icon: Icons.account_circle,
                title: 'My Profile',
                subtitle: 'View and edit your profile information',
                onTap: () => _showComingSoon(context),
              ),
              _buildDivider(),
              _buildSettingsTile(
                context,
                icon: Icons.notifications,
                title: 'Notifications',
                subtitle: 'Manage your notification preferences',
                onTap: () => _showComingSoon(context),
                trailing: Switch(
                  value: true,
                  onChanged: (value) => _showComingSoon(context),
                  activeColor: AppColors.secondary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Church Services Section
          _buildSectionHeader(context, 'Church Services', Icons.church),
          const SizedBox(height: 8),
          _buildSettingsCard(
            context,
            children: [
              _buildSettingsTile(
                context,
                icon: Icons.live_tv,
                title: 'Live Stream Settings',
                subtitle: 'Configure live streaming preferences',
                onTap: () => _showComingSoon(context),
              ),
              _buildDivider(),
              _buildSettingsTile(
                context,
                icon: Icons.event,
                title: 'Event Reminders',
                subtitle: 'Set reminders for church events',
                onTap: () => _showComingSoon(context),
              ),
              _buildDivider(),
              _buildSettingsTile(
                context,
                icon: Icons.volunteer_activism,
                title: 'Donation Preferences',
                subtitle: 'Manage your giving preferences',
                onTap: () => _showComingSoon(context),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // App Settings Section
          _buildSectionHeader(context, 'App Settings', Icons.settings),
          const SizedBox(height: 8),
          _buildSettingsCard(
            context,
            children: [
              _buildSettingsTile(
                context,
                icon: Icons.palette,
                title: 'Theme',
                subtitle: 'Light mode (Dark mode coming soon)',
                onTap: () => _showComingSoon(context),
              ),
              _buildDivider(),
              _buildSettingsTile(
                context,
                icon: Icons.language,
                title: 'Language',
                subtitle: 'English (More languages coming soon)',
                onTap: () => _showComingSoon(context),
              ),
              _buildDivider(),
              _buildSettingsTile(
                context,
                icon: Icons.storage,
                title: 'Storage & Cache',
                subtitle: 'Manage app data and cache',
                onTap: () => _showComingSoon(context),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Support Section
          _buildSectionHeader(context, 'Support & Information', Icons.help),
          const SizedBox(height: 8),
          _buildSettingsCard(
            context,
            children: [
              _buildSettingsTile(
                context,
                icon: Icons.help_outline,
                title: 'Help & FAQ',
                subtitle: 'Get help and find answers',
                onTap: () => _showComingSoon(context),
              ),
              _buildDivider(),
              _buildSettingsTile(
                context,
                icon: Icons.feedback,
                title: 'Send Feedback',
                subtitle: 'Share your thoughts with us',
                onTap: () => _showComingSoon(context),
              ),
              _buildDivider(),
              _buildSettingsTile(
                context,
                icon: Icons.info_outline,
                title: 'About SDA App',
                subtitle: 'Version 1.0.0',
                onTap: () => _showAboutDialog(context),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Privacy & Legal Section
          _buildSectionHeader(context, 'Privacy & Legal', Icons.security),
          const SizedBox(height: 8),
          _buildSettingsCard(
            context,
            children: [
              _buildSettingsTile(
                context,
                icon: Icons.privacy_tip,
                title: 'Privacy Policy',
                subtitle: 'Read our privacy policy',
                onTap: () => _showComingSoon(context),
              ),
              _buildDivider(),
              _buildSettingsTile(
                context,
                icon: Icons.description,
                title: 'Terms of Service',
                subtitle: 'Read our terms of service',
                onTap: () => _showComingSoon(context),
              ),
            ],
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  /// Build section header with icon and title
  Widget _buildSectionHeader(BuildContext context, String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: AppColors.secondary,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  /// Build settings card container
  Widget _buildSettingsCard(BuildContext context, {required List<Widget> children}) {
    return Card(
      elevation: 2,
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  /// Build individual settings tile
  Widget _buildSettingsTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Widget? trailing,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.secondary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 20,
          color: AppColors.secondary,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
      trailing: trailing ?? const Icon(
        Icons.chevron_right,
        color: AppColors.textSecondary,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }

  /// Build divider between settings items
  Widget _buildDivider() {
    return const Divider(
      height: 1,
      thickness: 1,
      color: AppColors.borderLight,
      indent: 16,
      endIndent: 16,
    );
  }

  /// Show coming soon dialog
  void _showComingSoon(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Row(
            children: [
              Icon(
                Icons.construction,
                color: AppColors.secondary,
                size: 24,
              ),
              SizedBox(width: 8),
              Text('Coming Soon'),
            ],
          ),
          content: const Text(
            'This feature is currently under development and will be available in a future update.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  /// Show about dialog
  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'SDA App',
      applicationVersion: '1.0.0',
      applicationIcon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.church,
          color: AppColors.textPrimary,
          size: 32,
        ),
      ),
      children: [
        const Text(
          'A comprehensive mobile application for the Seventh-day Adventist community, featuring live streaming, events, announcements, and donation capabilities.',
        ),
        const SizedBox(height: 16),
        const Text(
          'Built with Flutter and powered by Supabase.',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
