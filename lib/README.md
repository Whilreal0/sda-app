# SDA App - Clean Architecture with Riverpod

This Flutter application follows clean architecture principles with Riverpod state management.

## Project Structure

```
lib/
├── core/                           # Core functionality
│   ├── constants/                  # App-wide constants
│   │   └── app_constants.dart
│   ├── providers/                  # Global providers
│   │   ├── navigation_provider.dart
│   │   └── navigation_provider.g.dart
│   └── theme/                      # App theming
│       └── app_theme.dart
├── features/                       # Feature-based modules
│   ├── announcements/
│   │   ├── pages/
│   │   │   └── announcements_page.dart
│   │   └── widgets/
│   │       └── announcements_content.dart
│   ├── donations/
│   │   ├── pages/
│   │   │   └── donations_page.dart
│   │   └── widgets/
│   │       └── donations_content.dart
│   ├── events/
│   │   ├── pages/
│   │   │   └── events_page.dart
│   │   └── widgets/
│   │       └── events_content.dart
│   ├── home/
│   │   ├── pages/
│   │   │   └── home_page.dart
│   │   └── widgets/
│   │       └── home_content.dart
│   ├── navigation/
│   │   ├── pages/
│   │   │   └── main_screen.dart
│   │   └── widgets/
│   │       └── custom_bottom_navigation_bar.dart
│   └── settings/
│       ├── pages/
│       │   └── settings_page.dart
│       └── widgets/
│           └── settings_content.dart
├── shared/                         # Shared widgets and utilities
│   └── widgets/
│       └── page_content_template.dart
└── main.dart                       # App entry point
```

## Architecture Principles

### 1. Feature-Based Organization
- Each feature has its own directory under `features/`
- Features are self-contained with their own pages, widgets, and logic
- Promotes modularity and maintainability

### 2. Clean Separation of Concerns
- **Core**: Contains app-wide functionality (theme, constants, global providers)
- **Features**: Business logic organized by feature
- **Shared**: Reusable components across features

### 3. Riverpod State Management
- Uses latest Riverpod with code generation
- Providers are organized in the core/providers directory
- State management is reactive and efficient

### 4. Consistent UI Patterns
- Reusable widgets in shared directory
- Consistent theming through AppTheme
- Template-based approach for similar pages

## Key Features

### Navigation
- Bottom navigation bar with 5 tabs
- State managed through Riverpod
- IndexedStack for maintaining page state

### State Management
- Riverpod with code generation
- Type-safe providers
- Reactive state updates

### Theming
- Material 3 design system
- Centralized theme configuration
- Consistent color scheme

## Getting Started

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Generate Riverpod code:
   ```bash
   flutter packages pub run build_runner build
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Code Generation

This project uses Riverpod code generation. When you modify providers with `@riverpod` annotation, run:

```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Best Practices

1. **Consistent Naming**: Follow Dart naming conventions
2. **Immutable State**: Use immutable data structures
3. **Single Responsibility**: Each class/widget has one responsibility
4. **Dependency Injection**: Use Riverpod for dependency management
5. **Code Generation**: Leverage Riverpod generators for type safety
