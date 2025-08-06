import 'package:shared_preferences/shared_preferences.dart';
import 'bible_api_service.dart';

/// Service for caching bible verses locally
class BibleCacheService {
  static const String _dailyVerseKey = 'daily_verse';
  static const String _lastFetchDateKey = 'last_fetch_date';

  /// Get cached daily verse or fetch new dynamic KJV one if needed
  static Future<BibleVerse?> getDailyVerse() async {
    try {
      // Skip caching for now due to SharedPreferences issue
      final newVerse = await BibleApiService.getDynamicVerseOfTheDay();
      return newVerse;
    } catch (e) {
      return null;
    }
  }

  /// Get a completely fresh random KJV verse (bypasses cache)
  static Future<BibleVerse?> getFreshRandomVerse() async {
    try {
      final verse = await BibleApiService.getCompletelyRandomVerse();
      return verse;
    } catch (e) {
      return null;
    }
  }

  /// Clear the cache (useful for testing or manual refresh)
  static Future<void> clearCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_dailyVerseKey);
      await prefs.remove(_lastFetchDateKey);
    } catch (e) {
      // Handle error silently
    }
  }
} 