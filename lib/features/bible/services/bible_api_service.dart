import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

/// Bible verse data model
class BibleVerse {
  final String reference;
  final String text;
  final String translation;
  final String translationName;
  final String translationNote;

  BibleVerse({
    required this.reference,
    required this.text,
    required this.translation,
    required this.translationName,
    required this.translationNote,
  });

  factory BibleVerse.fromJson(Map<String, dynamic> json) {
    return BibleVerse(
      reference: json['reference'] ?? '',
      text: json['text'] ?? '',
      translation: json['translation_id'] ?? '',
      translationName: json['translation_name'] ?? '',
      translationNote: json['translation_note'] ?? '',
    );
  }
}

/// Bible API service using the correct Bible API endpoints
class BibleApiService {
  static const String _baseUrl = 'https://bible-api.com';
  
  // A pool of popular KJV verse references
  static const List<String> _kjvVersePool = [
    'John 3:16',
    'Romans 8:28',
    'Psalm 23:1',
    'Proverbs 3:5',
    'Isaiah 41:10',
    'Philippians 4:13',
    'Genesis 1:1',
    'Jeremiah 29:11',
    'Matthew 6:33',
    '1 Corinthians 13:4',
    'Joshua 1:9',
    'Psalm 119:105',
    'Galatians 5:22',
    'Ephesians 2:8',
    'Colossians 3:23',
    '1 Thessalonians 5:16',
    '2 Timothy 1:7',
    'Hebrews 11:1',
    'James 1:5',
    '1 Peter 5:7',
    '1 John 4:7',
    'Revelation 3:20',
    'Psalm 46:10',
    'Matthew 11:28',
    'John 14:6',
    'Acts 4:12',
    'Romans 10:9',
    '1 Corinthians 16:14',
    '2 Corinthians 5:17',
    'Galatians 2:20',
    'Ephesians 3:20',
    'Philippians 4:6',
    'Colossians 3:17',
    '1 Thessalonians 5:18',
    '2 Timothy 3:16',
    'Titus 3:5',
    'Hebrews 4:12',
    'James 4:7',
    '1 Peter 3:15',
    '2 Peter 1:3',
    '1 John 3:16',
    '2 John 1:6',
    '3 John 1:4',
    'Jude 1:24',
    'Revelation 21:4',
  ];
  
  /// Get a random KJV verse using the correct API format
  static Future<BibleVerse?> getRandomVerse() async {
    try {
      final random = Random();
      final randomVerse = _kjvVersePool[random.nextInt(_kjvVersePool.length)];
      final encodedVerse = randomVerse.replaceAll(' ', '+');
      final url = '$_baseUrl/$encodedVerse?translation=kjv';
      
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return BibleVerse.fromJson(data);
      }
    } catch (e) {
      // Handle error silently
    }
    return null;
  }

  /// Get a specific KJV verse by reference
  static Future<BibleVerse?> getVerseByReference(String reference) async {
    try {
      final encodedReference = reference.replaceAll(' ', '+');
      final url = '$_baseUrl/$encodedReference?translation=kjv';
      
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return BibleVerse.fromJson(data);
      }
    } catch (e) {
      // Handle error silently
    }
    return null;
  }

  /// Get a daily KJV verse based on current date
  static Future<BibleVerse?> getDailyVerse() async {
    try {
      final today = DateTime.now();
      final dayOfYear = today.difference(DateTime(today.year, 1, 1)).inDays;
      final verseIndex = dayOfYear % _kjvVersePool.length;
      final dailyVerse = _kjvVersePool[verseIndex];
      
      return await getVerseByReference(dailyVerse);
    } catch (e) {
      // Handle error silently
      return null;
    }
  }

  /// Get a completely fresh random KJV verse
  static Future<BibleVerse?> getCompletelyRandomVerse() async {
    try {
      final random = Random();
      final randomVerse = _kjvVersePool[random.nextInt(_kjvVersePool.length)];
      
      return await getVerseByReference(randomVerse);
    } catch (e) {
      // Handle error silently
      return null;
    }
  }

  /// Get a dynamic KJV verse of the day
  static Future<BibleVerse?> getDynamicVerseOfTheDay() async {
    final now = DateTime.now();
    final hour = now.hour;
    
    BibleVerse? verse;
    
    if (hour < 6) {
      // Early morning - Psalms for meditation
      verse = await getVerseByReference('Psalm 23:1');
    } else if (hour < 12) {
      // Morning - Gospels for inspiration
      verse = await getVerseByReference('John 3:16');
    } else if (hour < 18) {
      // Afternoon - New Testament for guidance
      verse = await getVerseByReference('Romans 8:28');
    } else {
      // Evening - Old Testament for reflection
      verse = await getVerseByReference('Isaiah 41:10');
    }
    
    // If specific type failed, try general random
    verse ??= await getRandomVerse();
    
    return verse;
  }
} 