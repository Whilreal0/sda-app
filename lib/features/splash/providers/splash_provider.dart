import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_provider.g.dart';

/// Splash screen state
enum SplashState {
  loading,
  completed,
}

/// Splash screen provider to manage splash screen state
@riverpod
class SplashNotifier extends _$SplashNotifier {
  @override
  SplashState build() => SplashState.loading;

  /// Complete the splash screen
  void completeSplash() {
    state = SplashState.completed;
  }

  /// Reset splash screen state
  void resetSplash() {
    state = SplashState.loading;
  }
}

/// Provider to check if splash is completed
@riverpod
bool isSplashCompleted(IsSplashCompletedRef ref) {
  final splashState = ref.watch(splashNotifierProvider);
  return splashState == SplashState.completed;
}
