import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_colors.dart';
import '../providers/bible_provider.dart';
import '../services/bible_api_service.dart';

/// Bible study page content widget
class BibleContent extends ConsumerWidget {
  const BibleContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyVerseAsync = ref.watch(dailyVerseProvider);
    final isLoading = ref.watch(bibleLoadingProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          _buildHeader(context),
          const SizedBox(height: 24),
          
          // Daily Reading
          _buildDailyReading(context, ref, dailyVerseAsync, isLoading),
          const SizedBox(height: 24),
          
          // Study Materials
          _buildStudyMaterials(context),
          const SizedBox(height: 24),
          
          // Sermon Archives
          _buildSermonArchives(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.secondaryGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(
            Icons.menu_book,
            size: 48,
            color: AppColors.surface,
          ),
          const SizedBox(height: 12),
          const Text(
            'Bible Study',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.surface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Grow in your faith through daily reading and study',
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

  Widget _buildDailyReading(BuildContext context, WidgetRef ref, AsyncValue<BibleVerse?> dailyVerseAsync, bool isLoading) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Daily Reading',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: isLoading ? null : () {
                    ref.invalidate(dailyVerseProvider);
                  },
                  icon: isLoading 
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.refresh),
                  tooltip: 'Refresh daily verse',
                ),
                IconButton(
                  onPressed: isLoading ? null : () {
                    ref.invalidate(freshRandomVerseProvider);
                  },
                  icon: const Icon(Icons.shuffle),
                  tooltip: 'Get new random verse',
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Show fresh random verse if available, otherwise show daily verse
        Consumer(
          builder: (context, ref, child) {
            final freshVerseAsync = ref.watch(freshRandomVerseProvider);
            
            return freshVerseAsync.when(
              data: (freshVerse) => freshVerse != null 
                ? _buildVerseCard(context, freshVerse)
                : dailyVerseAsync.when(
                    data: (verse) => verse != null 
                      ? _buildVerseCard(context, verse)
                      : _buildErrorCard(context, ref, 'No verse available'),
                    loading: () => _buildLoadingCard(),
                    error: (error, stack) => _buildErrorCard(context, ref, 'Error loading verse'),
                  ),
              loading: () => _buildLoadingCard(),
              error: (error, stack) => dailyVerseAsync.when(
                data: (verse) => verse != null 
                  ? _buildVerseCard(context, verse)
                  : _buildErrorCard(context, ref, 'No verse available'),
                loading: () => _buildLoadingCard(),
                error: (error, stack) => _buildErrorCard(context, ref, 'Error loading verse'),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildVerseCard(BuildContext context, BibleVerse verse) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.calendar_today,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today\'s Reading',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      'King James Version',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'KJV',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.primary.withOpacity(0.1)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  verse.reference,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  verse.text.trim(),
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textPrimary,
                    height: 1.6,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Read full chapter
                  },
                  icon: const Icon(Icons.menu_book),
                  label: const Text('Read Chapter'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Share verse
                  },
                  icon: const Icon(Icons.share),
                  label: const Text('Share'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Column(
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text(
            'Loading today\'s verse...',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorCard(BuildContext context, WidgetRef ref, String errorMessage) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.error),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            Icons.error_outline,
            color: AppColors.error,
            size: 48,
          ),
          const SizedBox(height: 16),
          Text(
            'Unable to load today\'s verse',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              ref.invalidate(dailyVerseProvider);
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudyMaterials(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Study Materials',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ..._getStudyMaterials().map((material) => 
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _StudyMaterialCard(material: material),
          ),
        ),
      ],
    );
  }

  Widget _buildSermonArchives(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sermon Archives',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ..._getSermonArchives().map((sermon) => 
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _SermonCard(sermon: sermon),
          ),
        ),
      ],
    );
  }

  List<StudyMaterial> _getStudyMaterials() {
    return [
      StudyMaterial(
        title: 'Bible Study Guide',
        description: 'Weekly study guide for small groups',
        icon: Icons.groups,
        color: AppColors.primary,
        isNew: true,
      ),
      StudyMaterial(
        title: 'Daily Devotional',
        description: 'Short daily reflections and prayers',
        icon: Icons.lightbulb,
        color: AppColors.secondary,
        isNew: false,
      ),
      StudyMaterial(
        title: 'Bible Reading Plan',
        description: 'One-year Bible reading schedule',
        icon: Icons.schedule,
        color: AppColors.info,
        isNew: false,
      ),
      StudyMaterial(
        title: 'Study Resources',
        description: 'Commentaries and reference materials',
        icon: Icons.library_books,
        color: AppColors.warning,
        isNew: false,
      ),
    ];
  }

  List<SermonArchive> _getSermonArchives() {
    return [
      SermonArchive(
        title: 'The Power of Prayer',
        preacher: 'Pastor Michael',
        date: DateTime.now().subtract(const Duration(days: 7)),
        duration: '45 min',
        isRecent: true,
      ),
      SermonArchive(
        title: 'Walking in Faith',
        preacher: 'Pastor Sarah',
        date: DateTime.now().subtract(const Duration(days: 14)),
        duration: '38 min',
        isRecent: false,
      ),
      SermonArchive(
        title: 'Community and Fellowship',
        preacher: 'Pastor David',
        date: DateTime.now().subtract(const Duration(days: 21)),
        duration: '42 min',
        isRecent: false,
      ),
    ];
  }
}

/// Study material data model
class StudyMaterial {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final bool isNew;

  StudyMaterial({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.isNew,
  });
}

/// Sermon archive data model
class SermonArchive {
  final String title;
  final String preacher;
  final DateTime date;
  final String duration;
  final bool isRecent;

  SermonArchive({
    required this.title,
    required this.preacher,
    required this.date,
    required this.duration,
    required this.isRecent,
  });
}

/// Study material card widget
class _StudyMaterialCard extends StatelessWidget {
  final StudyMaterial material;

  const _StudyMaterialCard({required this.material});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: material.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              material.icon,
              color: material.color,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        material.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    if (material.isNew)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.error,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'NEW',
                          style: TextStyle(
                            color: AppColors.surface,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  material.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.textSecondary,
            size: 16,
          ),
        ],
      ),
    );
  }
}

/// Sermon card widget
class _SermonCard extends StatelessWidget {
  final SermonArchive sermon;

  const _SermonCard({required this.sermon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: sermon.isRecent ? AppColors.primary : AppColors.borderLight,
          width: sermon.isRecent ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.play_circle_outline,
                color: AppColors.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  sermon.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              if (sermon.isRecent)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'RECENT',
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
            sermon.preacher,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                _formatDate(sermon.date),
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                sermon.duration,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  // TODO: Play sermon
                },
                icon: const Icon(
                  Icons.play_arrow,
                  color: AppColors.primary,
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
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
} 