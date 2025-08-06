import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';

/// Facebook live content widget
class FacebookLiveContent extends StatelessWidget {
  const FacebookLiveContent({super.key});

  Future<void> _launchFacebook() async {
    const String facebookUrl = 'https://www.facebook.com/C5SDAC';
    
    try {
      // Try to open in Facebook app first
      final Uri facebookAppUri = Uri.parse('fb://page/C5SDAC');
      if (await canLaunchUrl(facebookAppUri)) {
        await launchUrl(facebookAppUri, mode: LaunchMode.externalApplication);
      } else {
        // Fallback to web browser
        final Uri webUri = Uri.parse(facebookUrl);
        await launchUrl(webUri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      // If both fail, try opening in browser
      final Uri webUri = Uri.parse(facebookUrl);
      await launchUrl(webUri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowLight,
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.live_tv,
                    size: 80,
                    color: AppColors.primary,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Facebook Live',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Connect with us on Facebook for live services',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: _launchFacebook,
                    icon: const Icon(Icons.facebook),
                    label: const Text('Go to Facebook'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.surface,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 