import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/bible_api_service.dart';
import '../services/bible_cache_service.dart';

/// Provider for daily bible verse with caching
final dailyVerseProvider = FutureProvider<BibleVerse?>((ref) async {
  return await BibleCacheService.getDailyVerse();
});

/// Provider for loading state
final bibleLoadingProvider = StateProvider<bool>((ref) => false);

/// Provider for fresh random verse (bypasses cache)
final freshRandomVerseProvider = FutureProvider<BibleVerse?>((ref) async {
  return await BibleCacheService.getFreshRandomVerse();
});

/// Provider for refreshing daily verse (bypasses cache)
final refreshDailyVerseProvider = FutureProvider.family<BibleVerse?, void>((ref, _) async {
  ref.read(bibleLoadingProvider.notifier).state = true;
  try {
    // Clear cache to force fresh fetch
    await BibleCacheService.clearCache();
    final verse = await BibleApiService.getDynamicVerseOfTheDay();
    return verse;
  } finally {
    ref.read(bibleLoadingProvider.notifier).state = false;
  }
}); 