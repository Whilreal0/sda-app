import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';

/// Events page content widget with detailed event cards
class EventsContent extends StatelessWidget {
  const EventsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section
          _buildHeader(context),
          const SizedBox(height: AppConstants.defaultPadding),
          
          // Events list
          Expanded(
            child: _buildEventsList(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upcoming Events',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Join us for these exciting events',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
      ],
    );
  }

  Widget _buildEventsList(BuildContext context) {
    final events = _getSampleEvents();
    
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return _EventCard(event: event);
      },
    );
  }

  List<EventData> _getSampleEvents() {
    return [
      EventData(
        title: 'Saturday Service',
        description: 'Join us for our weekly Saturday service with inspiring worship and powerful message.',
        date: DateTime.now().add(const Duration(days: 2)),
        time: '10:00 AM',
        location: 'Main Sanctuary',
        imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
        category: 'Service',
        isFeatured: true,
      ),
      EventData(
        title: 'Youth Group Meeting',
        description: 'A fun evening for young people to connect, learn, and grow together.',
        date: DateTime.now().add(const Duration(days: 4)),
        time: '6:30 PM',
        location: 'Youth Center',
        imageUrl: 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=400',
        category: 'Youth',
        isFeatured: false,
      ),
      EventData(
        title: 'Prayer Meeting',
        description: 'Come together for a time of prayer, fellowship, and spiritual renewal.',
        date: DateTime.now().add(const Duration(days: 6)),
        time: '7:00 PM',
        location: 'Prayer Room',
        imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400',
        category: 'Prayer',
        isFeatured: false,
      ),
      EventData(
        title: 'Community Outreach',
        description: 'Help us serve our local community through various outreach activities.',
        date: DateTime.now().add(const Duration(days: 8)),
        time: '9:00 AM',
        location: 'Various Locations',
        imageUrl: 'https://images.unsplash.com/photo-1559027615-cd4628902d4a?w=400',
        category: 'Outreach',
        isFeatured: true,
      ),
      EventData(
        title: 'Bible Study',
        description: 'Deep dive into scripture with our weekly Bible study group.',
        date: DateTime.now().add(const Duration(days: 10)),
        time: '7:30 PM',
        location: 'Fellowship Hall',
        imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
        category: 'Study',
        isFeatured: false,
      ),
    ];
  }
}

/// Event data model
class EventData {
  final String title;
  final String description;
  final DateTime date;
  final String time;
  final String location;
  final String imageUrl;
  final String category;
  final bool isFeatured;

  EventData({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.imageUrl,
    required this.category,
    this.isFeatured = false,
  });
}

/// Event card widget
class _EventCard extends StatelessWidget {
  final EventData event;

  const _EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Event image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Stack(
              children: [
                Image.network(
                  event.imageUrl,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 160,
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.surfaceContainerHighest,
                      child: Icon(
                        Icons.event,
                        size: 48,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    );
                  },
                ),
                if (event.isFeatured)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Featured',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          
          // Event details
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
                        event.category,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondaryContainer,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      _formatDate(event.date),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 8),
                
                // Event title
                Text(
                  event.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                const SizedBox(height: 8),
                
                // Event description
                Text(
                  event.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                
                const SizedBox(height: 12),
                
                // Time and location
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      event.time,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        event.location,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 12),
                
                // Action buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // TODO: Implement event details
                        },
                        icon: const Icon(Icons.info_outline),
                        label: const Text('Details'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // TODO: Implement RSVP functionality
                        },
                        icon: const Icon(Icons.rsvp),
                        label: const Text('RSVP'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = date.difference(now).inDays;
    
    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Tomorrow';
    } else if (difference < 7) {
      return '${date.weekday == 1 ? 'Mon' : date.weekday == 2 ? 'Tue' : date.weekday == 3 ? 'Wed' : date.weekday == 4 ? 'Thu' : date.weekday == 5 ? 'Fri' : date.weekday == 6 ? 'Sat' : 'Sun'}, ${date.day} ${date.month == 1 ? 'Jan' : date.month == 2 ? 'Feb' : date.month == 3 ? 'Mar' : date.month == 4 ? 'Apr' : date.month == 5 ? 'May' : date.month == 6 ? 'Jun' : date.month == 7 ? 'Jul' : date.month == 8 ? 'Aug' : date.month == 9 ? 'Sep' : date.month == 10 ? 'Oct' : date.month == 11 ? 'Nov' : 'Dec'}';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
