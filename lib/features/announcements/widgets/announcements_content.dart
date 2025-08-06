import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';

/// Announcements page content widget with detailed news and announcements
class AnnouncementsContent extends StatelessWidget {
  const AnnouncementsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Subtitle
          Text(
            'Stay connected with our church community',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          const SizedBox(height: 20),
          
          // Search bar
          _buildSearchBar(context),
          const SizedBox(height: 16),
          
          // Quick actions
          _buildQuickActions(context),
          const SizedBox(height: 16),
          
          // Filter tabs
          _buildFilterTabs(context),
          const SizedBox(height: 16),
          
          // Announcements list
          _buildAnnouncementsList(context),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search announcements...',
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.outline,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              // TODO: Implement advanced search
            },
            icon: Icon(
              Icons.tune,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        onChanged: (value) {
          // TODO: Implement search functionality
        },
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 80, // Fixed container height
          child: Row(
            children: [
              Expanded(
                child: _QuickActionCard(
                  icon: Icons.notifications_active,
                  title: 'Notify',
                  subtitle: 'Alerts',
                  color: Theme.of(context).colorScheme.primary,
                  onTap: () {
                    // TODO: Navigate to notification settings
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _QuickActionCard(
                  icon: Icons.bookmark_outline,
                  title: 'Saved',
                  subtitle: 'Items',
                  color: Theme.of(context).colorScheme.secondary,
                  onTap: () {
                    // TODO: Navigate to saved announcements
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _QuickActionCard(
                  icon: Icons.share,
                  title: 'Share',
                  subtitle: 'Content',
                  color: Theme.of(context).colorScheme.tertiary,
                  onTap: () {
                    // TODO: Share announcements
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterTabs(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _FilterChip(
            label: 'All',
            isSelected: true,
            onTap: () {},
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'News',
            isSelected: false,
            onTap: () {},
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'Announcements',
            isSelected: false,
            onTap: () {},
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'Updates',
            isSelected: false,
            onTap: () {},
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'Ministry',
            isSelected: false,
            onTap: () {},
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'Urgent',
            isSelected: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementsList(BuildContext context) {
    final announcements = _getSampleAnnouncements();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Announcements',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        ...announcements.map((announcement) => 
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _AnnouncementCard(announcement: announcement),
          ),
        ),
      ],
    );
  }

  List<AnnouncementData> _getSampleAnnouncements() {
    return [
      AnnouncementData(
        title: 'New Youth Ministry Director Announced',
        content: 'We are excited to welcome Sarah Johnson as our new Youth Ministry Director. Sarah brings over 10 years of experience in youth ministry and will be joining us starting next month.',
        date: DateTime.now().subtract(const Duration(hours: 2)),
        author: 'Pastor Michael',
        category: 'News',
        priority: 'High',
        imageUrl: 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=400',
        isPinned: true,
        hasNotification: true,
      ),
      AnnouncementData(
        title: 'Community Food Drive This Weekend',
        content: 'Join us this Saturday for our monthly community food drive. We\'ll be collecting non-perishable items to support local families in need. Meet at the church parking lot at 9 AM.',
        date: DateTime.now().subtract(const Duration(days: 1)),
        author: 'Outreach Team',
        category: 'Announcements',
        priority: 'Medium',
        imageUrl: 'https://images.unsplash.com/photo-1559027615-cd4628902d4a?w=400',
        isPinned: false,
        hasNotification: false,
      ),
      AnnouncementData(
        title: 'Saturday Service Schedule Update',
        content: 'Starting next week, our Saturday services will have a new schedule: 9:00 AM Traditional Service, 11:00 AM Contemporary Service. Children\'s ministry available during both services.',
        date: DateTime.now().subtract(const Duration(days: 1)),
        author: 'Church Office',
        category: 'Schedule',
        priority: 'High',
        imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
        isPinned: true,
        hasNotification: true,
      ),
      AnnouncementData(
        title: 'Bible Study Group Registration Open',
        content: 'Registration is now open for our new Bible study groups. We have options for beginners, intermediate, and advanced levels. Groups will meet weekly starting in two weeks.',
        date: DateTime.now().subtract(const Duration(days: 3)),
        author: 'Education Ministry',
        category: 'Ministry',
        priority: 'Medium',
        imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400',
        isPinned: false,
        hasNotification: false,
      ),
      AnnouncementData(
        title: 'Church Renovation Project Complete',
        content: 'We are pleased to announce that our sanctuary renovation project has been completed! The new sound system and lighting will enhance our worship experience. Come see the improvements this Saturday.',
        date: DateTime.now().subtract(const Duration(days: 4)),
        author: 'Facilities Committee',
        category: 'News',
        priority: 'Medium',
        imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
        isPinned: false,
        hasNotification: false,
      ),
      AnnouncementData(
        title: 'Prayer Request Updates',
        content: 'Thank you for your prayers for the Johnson family. We\'re happy to report that Mrs. Johnson\'s surgery was successful and she is recovering well. Please continue to keep them in your thoughts.',
        date: DateTime.now().subtract(const Duration(days: 5)),
        author: 'Prayer Team',
        category: 'Updates',
        priority: 'Low',
        imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400',
        isPinned: false,
        hasNotification: false,
      ),
      AnnouncementData(
        title: 'Volunteer Opportunities Available',
        content: 'We\'re looking for volunteers for our children\'s ministry, greeter team, and technical support. If you\'re interested in serving, please contact the church office or speak with any ministry leader.',
        date: DateTime.now().subtract(const Duration(days: 6)),
        author: 'Ministry Team',
        category: 'Ministry',
        priority: 'Medium',
        imageUrl: 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=400',
        isPinned: false,
        hasNotification: false,
      ),
    ];
  }
}

/// Quick action card widget
class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 60,
          maxHeight: 80,
        ),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: color.withOpacity(0.3),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 20,
            ),
            const SizedBox(height: 2),
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              child: Text(
                subtitle,
                style: TextStyle(
                  color: color.withOpacity(0.7),
                  fontSize: 9,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Filter chip widget
class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected 
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected 
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.outline.withOpacity(0.3),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected 
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.onSurfaceVariant,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

/// Announcement data model
class AnnouncementData {
  final String title;
  final String content;
  final DateTime date;
  final String author;
  final String category;
  final String priority;
  final String imageUrl;
  final bool isPinned;
  final bool hasNotification;

  AnnouncementData({
    required this.title,
    required this.content,
    required this.date,
    required this.author,
    required this.category,
    required this.priority,
    required this.imageUrl,
    this.isPinned = false,
    this.hasNotification = false,
  });
}

/// Announcement card widget
class _AnnouncementCard extends StatelessWidget {
  final AnnouncementData announcement;

  const _AnnouncementCard({required this.announcement});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: announcement.isPinned ? 4 : 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: announcement.isPinned 
          ? BorderSide(color: Theme.of(context).colorScheme.primary, width: 2)
          : BorderSide.none,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with image
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  announcement.imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 120,
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.surfaceContainerHighest,
                      child: Icon(
                        Icons.article,
                        size: 48,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    );
                  },
                ),
              ),
              // Priority badge
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getPriorityColor(context, announcement.priority),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    announcement.priority,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Pinned badge
              if (announcement.isPinned)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.push_pin,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              // Notification indicator
              if (announcement.hasNotification)
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.notifications_active,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category and date
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        announcement.category,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondaryContainer,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      _formatDate(announcement.date),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 8),
                
                // Title
                Text(
                  announcement.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                const SizedBox(height: 8),
                
                // Content preview
                Text(
                  announcement.content,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                
                const SizedBox(height: 12),
                
                // Author and actions
                Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 16,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      announcement.author,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        // TODO: Implement share functionality
                      },
                      icon: Icon(
                        Icons.share_outlined,
                        size: 20,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // TODO: Implement bookmark functionality
                      },
                      icon: Icon(
                        Icons.bookmark_outline,
                        size: 20,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 8),
                
                // Read more button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      // TODO: Navigate to full announcement
                    },
                    child: const Text('Read More'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getPriorityColor(BuildContext context, String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Theme.of(context).colorScheme.primary;
    }
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
