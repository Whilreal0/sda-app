# Copilot Instructions for SDA App (Flutter)

## Project Overview
- **Architecture:** Clean Architecture with feature-based modules and Riverpod for state management.
- **Entry Point:** `lib/main.dart` initializes the app and sets up navigation and theming.
- **Features:** Each feature (e.g., announcements, donations, events, home, navigation, settings, splash) is self-contained under `lib/features/` with its own `pages/` and `widgets/`.
- **Core Layer:** `lib/core/` holds app-wide constants, providers, and theming.
- **Shared Layer:** `lib/shared/` contains reusable widgets and templates.

## Key Patterns & Conventions
- **Riverpod:** State management is handled via Riverpod with code generation. Providers are in `lib/core/providers/`. Always run `flutter packages pub run build_runner build --delete-conflicting-outputs` after changing providers.
- **Navigation:** Bottom navigation is managed with Riverpod and an `IndexedStack` for stateful tab navigation. See `lib/features/navigation/`.
- **UI Consistency:** Use shared widgets from `lib/shared/widgets/` and theming from `lib/core/theme/app_theme.dart`.
- **Feature Isolation:** Each feature directory contains its own UI and logic. Avoid cross-feature imports except via shared/core.
- **Splash Screen:** Custom animated splash screen in `lib/features/splash/` with immersive mode and branded transitions.

## Developer Workflows
- **Install dependencies:**
  ```sh
  flutter pub get
  ```
- **Code generation (Riverpod):**
  ```sh
  flutter packages pub run build_runner build --delete-conflicting-outputs
  ```
- **Run the app:**
  ```sh
  flutter run
  ```
- **Add new features:**
  - Create a new folder under `lib/features/` with `pages/` and `widgets/`.
  - Register providers in `lib/core/providers/` if global state is needed.

## Integration Points
- **Theming:** Centralized in `lib/core/theme/app_theme.dart`.
- **Constants:** Use `lib/core/constants/` for app-wide values.
- **Navigation:** Managed via Riverpod and custom bottom navigation bar.
- **Splash:** Native and Flutter splash integration (see `lib/features/splash/README.md`).

## Examples
- **Feature Widget:** `lib/features/donations/widgets/donations_content.dart`
- **Feature Page:** `lib/features/donations/pages/donations_page.dart`
- **Provider:** `lib/core/providers/navigation_provider.dart`

## Special Notes
- **Do not place business logic in UI widgets.** Use providers and feature logic classes.
- **Follow Dart and Flutter naming conventions.**
- **Keep features decoupled.** Use shared/core only for cross-feature code.

---
For more details, see `lib/README.md` and feature-specific `README.md` files.
