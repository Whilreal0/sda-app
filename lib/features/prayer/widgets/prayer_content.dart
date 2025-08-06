import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_colors.dart';

/// Prayer requests page content widget
class PrayerContent extends StatelessWidget {
  const PrayerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          _buildHeader(context),
          const SizedBox(height: 24),
          
          // Submit Prayer Request
          _buildSubmitSection(context),
          const SizedBox(height: 24),
          
          // Prayer Wall
          _buildPrayerWall(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: const Column(
        children: [
          Icon(
            Icons.favorite,
            size: 48,
            color: AppColors.surface,
          ),
          SizedBox(height: 12),
          Text(
            'Prayer Requests',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.surface,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Share your prayer requests and pray for others in our community',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.surface,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Submit Prayer Request',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderLight),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowLight,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Your prayer request...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.primary, width: 2),
                  ),
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text('Keep anonymous'),
                      value: false,
                      onChanged: (value) {
                        // TODO: Implement anonymous toggle
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Submit prayer request
                  },
                  icon: const Icon(Icons.send),
                  label: const Text('Submit Prayer Request'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPrayerWall(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Prayer Wall',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.success,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '12 Active',
                style: TextStyle(
                  color: AppColors.surface,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ..._getSamplePrayerRequests().map((prayer) => 
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _PrayerCard(prayer: prayer),
          ),
        ),
      ],
    );
  }

  List<PrayerRequest> _getSamplePrayerRequests() {
    return [
      PrayerRequest(
        id: '1',
        request: 'Pray for my mother who is recovering from surgery. She needs strength and healing.',
        isAnonymous: false,
        author: 'Sarah Johnson',
        date: DateTime.now().subtract(const Duration(hours: 2)),
        prayerCount: 8,
        isAnswered: false,
      ),
      PrayerRequest(
        id: '2',
        request: 'Please pray for our youth group as we prepare for the upcoming mission trip.',
        isAnonymous: false,
        author: 'Youth Ministry',
        date: DateTime.now().subtract(const Duration(days: 1)),
        prayerCount: 15,
        isAnswered: false,
      ),
      PrayerRequest(
        id: '3',
        request: 'Praying for guidance in making an important career decision.',
        isAnonymous: true,
        author: 'Anonymous',
        date: DateTime.now().subtract(const Duration(days: 2)),
        prayerCount: 5,
        isAnswered: false,
      ),
      PrayerRequest(
        id: '4',
        request: 'Thank you for your prayers! My job interview went well and I got the position.',
        isAnonymous: false,
        author: 'Michael Chen',
        date: DateTime.now().subtract(const Duration(days: 3)),
        prayerCount: 12,
        isAnswered: true,
      ),
    ];
  }
}

/// Prayer request data model
class PrayerRequest {
  final String id;
  final String request;
  final bool isAnonymous;
  final String author;
  final DateTime date;
  final int prayerCount;
  final bool isAnswered;

  PrayerRequest({
    required this.id,
    required this.request,
    required this.isAnonymous,
    required this.author,
    required this.date,
    required this.prayerCount,
    required this.isAnswered,
  });
}

/// Prayer card widget
class _PrayerCard extends StatelessWidget {
  final PrayerRequest prayer;

  const _PrayerCard({required this.prayer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: prayer.isAnswered ? AppColors.success : AppColors.borderLight,
          width: prayer.isAnswered ? 2 : 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
                             Icon(
                 prayer.isAnswered ? Icons.check_circle : Icons.favorite,
                 color: prayer.isAnswered ? AppColors.success : AppColors.primary,
                 size: 20,
               ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  prayer.author,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              if (prayer.isAnswered)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.success,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'ANSWERED',
                    style: TextStyle(
                      color: AppColors.surface,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            prayer.request,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                _formatDate(prayer.date),
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const Icon(
                    Icons.favorite,
                    size: 16,
                    color: AppColors.error,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${prayer.prayerCount} praying',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              TextButton(
                onPressed: () {
                  // TODO: Add prayer count
                },
                child: const Text(
                  'I\'m Praying',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return '${difference.inMinutes} minutes ago';
      }
      return '${difference.inHours} hours ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
} 