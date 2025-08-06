// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isSplashCompletedHash() => r'5a74a3eafd7955900b1b15d52f42361d1bea1ce9';

/// Provider to check if splash is completed
///
/// Copied from [isSplashCompleted].
@ProviderFor(isSplashCompleted)
final isSplashCompletedProvider = AutoDisposeProvider<bool>.internal(
  isSplashCompleted,
  name: r'isSplashCompletedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isSplashCompletedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsSplashCompletedRef = AutoDisposeProviderRef<bool>;
String _$splashNotifierHash() => r'92434c691f333ead11cc6e12fa41257998c8513d';

/// Splash screen provider to manage splash screen state
///
/// Copied from [SplashNotifier].
@ProviderFor(SplashNotifier)
final splashNotifierProvider =
    AutoDisposeNotifierProvider<SplashNotifier, SplashState>.internal(
      SplashNotifier.new,
      name: r'splashNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$splashNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SplashNotifier = AutoDisposeNotifier<SplashState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
