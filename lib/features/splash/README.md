# SDA App Splash Screen

## Overview

Custom splash screen implementation for the SDA App that replaces the default Flutter splash screen with a branded, animated experience.

## Features

### 🎨 **Visual Design**
- **Gradient Background**: Golden Yellow to Royal Blue gradient matching SDA theme
- **Logo Animation**: Church icon with fade and scale animations
- **Typography**: Clean, branded text with proper hierarchy
- **Loading Indicator**: Subtle circular progress indicator

### ✨ **Animations**
- **Fade Animation**: Logo fades in smoothly (1000ms)
- **Scale Animation**: Logo scales from 0.5 to 1.0 with elastic curve (800ms)
- **Slide Animation**: Text slides up from bottom (600ms)
- **Staggered Timing**: Animations start in sequence for polished feel

### 📱 **System Integration**
- **Immersive Mode**: Hides status bar and navigation bar during splash
- **System UI Restoration**: Restores normal UI when transitioning to main app
- **Smooth Transition**: Fade transition to main screen (500ms)

## File Structure

```
features/splash/
├── pages/
│   └── splash_screen.dart          # Main splash screen widget
├── providers/
│   ├── splash_provider.dart        # Splash state management
│   └── splash_provider.g.dart      # Generated Riverpod code
└── README.md                       # This documentation
```

## Implementation Details

### Splash Screen Widget
```dart
class SplashScreen extends ConsumerStatefulWidget {
  // Animated splash screen with multiple controllers
  // - Fade animation for logo
  // - Scale animation for logo
  // - Slide animation for text
}
```

### Animation Sequence
1. **Logo Fade In** (0ms - 1000ms)
2. **Logo Scale** (200ms - 1000ms) 
3. **Text Slide Up** (600ms - 1200ms)
4. **Hold Display** (1200ms - 3000ms)
5. **Navigate to Main** (3000ms)

### System UI Configuration
```dart
// Hide system UI for immersive experience
SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

// Restore system UI when leaving splash
SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
```

## Android Configuration

### Launch Background
- **File**: `android/app/src/main/res/drawable/launch_background.xml`
- **Background**: Gradient from Golden Yellow to Royal Blue
- **Purpose**: Seamless transition from native splash to Flutter splash

### Styles Configuration
- **Light Theme**: Uses custom gradient background
- **Dark Theme**: Same gradient (consistent branding)

## Usage

### Integration
The splash screen is automatically shown as the initial route in `main.dart`:

```dart
MaterialApp(
  home: const SplashScreen(), // ✅ Splash screen as entry point
  // ... other configuration
)
```

### Customization
To modify the splash screen:

1. **Duration**: Change delay in `_startSplashSequence()`
2. **Colors**: Update gradient colors in the Container decoration
3. **Logo**: Replace the church icon with custom logo
4. **Text**: Modify app name and subtitle
5. **Animations**: Adjust animation controllers and curves

## Performance Considerations

- **Lightweight**: Minimal dependencies and efficient animations
- **Memory Efficient**: Proper disposal of animation controllers
- **Fast Loading**: Quick initialization and smooth transitions
- **Native Integration**: Seamless handoff from native splash

## Accessibility

- **Screen Reader**: Proper semantic labels for logo and text
- **Reduced Motion**: Respects system accessibility preferences
- **High Contrast**: Good contrast ratios for text on gradient background

## Future Enhancements

- [ ] Add app version display
- [ ] Implement loading progress for app initialization
- [ ] Add sound effects (optional)
- [ ] Support for different screen sizes and orientations
- [ ] Add error handling for failed app initialization
