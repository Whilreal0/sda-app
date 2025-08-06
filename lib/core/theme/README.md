# SDA App Theme Documentation

## Color Palette

### Primary Colors

#### Golden Yellow (Primary)
- **HEX**: `#FBBF24`
- **RGB**: `251, 191, 36`
- **Usage**: AppBar, buttons, icons, highlights, main actions
- **Access**: `Theme.of(context).colorScheme.primary` or `AppColors.secondary`

#### Royal Blue (Secondary)
- **HEX**: `#1E3A8A`
- **RGB**: `30, 58, 138`
- **Usage**: Accents, secondary actions, complementary elements
- **Access**: `Theme.of(context).colorScheme.secondary` or `AppColors.primary`

### Background Colors

#### Very Light Gray (Background)
- **HEX**: `#F9FAFB`
- **RGB**: `249, 250, 251`
- **Usage**: Screen backgrounds
- **Access**: `Theme.of(context).colorScheme.surfaceContainerLowest` or `AppColors.background`

#### White (Surface)
- **HEX**: `#FFFFFF`
- **Usage**: Cards, containers, modals
- **Access**: `Theme.of(context).colorScheme.surface` or `AppColors.surface`

### Text Colors

#### Dark Gray (Primary Text)
- **HEX**: `#111827`
- **Usage**: Clean, readable text
- **Access**: `Theme.of(context).textTheme.bodyLarge?.color` or `AppColors.textPrimary`

#### Muted Gray (Secondary Text)
- **HEX**: `#6B7280`
- **Usage**: Subtitles, secondary info
- **Access**: `Theme.of(context).colorScheme.outline` or `AppColors.textSecondary`

## Theme Usage Examples

### Accessing Colors

```dart
// Using Theme context
final primaryColor = Theme.of(context).colorScheme.primary;
final backgroundColor = Theme.of(context).colorScheme.surfaceContainerLowest;
final textColor = Theme.of(context).textTheme.bodyLarge?.color;

// Using AppColors directly
final primaryColor = AppColors.primary;
final backgroundColor = AppColors.background;
final textColor = AppColors.textPrimary;

// Using extension (recommended)
final primaryColor = context.colors.primary;
final backgroundColor = context.colors.surfaceContainerLowest;
final textStyle = context.textTheme.bodyLarge;
```

### Button Styles

```dart
// Primary button (automatically styled)
ElevatedButton(
  onPressed: () {},
  child: Text('Primary Action'),
)

// Secondary button
OutlinedButton(
  onPressed: () {},
  child: Text('Secondary Action'),
)

// Text button
TextButton(
  onPressed: () {},
  child: Text('Text Action'),
)
```

### Text Styles

```dart
// Headlines
Text('Large Headline', style: context.textTheme.headlineLarge)
Text('Medium Headline', style: context.textTheme.headlineMedium)
Text('Small Headline', style: context.textTheme.headlineSmall)

// Titles
Text('Large Title', style: context.textTheme.titleLarge)
Text('Medium Title', style: context.textTheme.titleMedium)
Text('Small Title', style: context.textTheme.titleSmall)

// Body text
Text('Large Body', style: context.textTheme.bodyLarge)
Text('Medium Body', style: context.textTheme.bodyMedium)
Text('Small Body', style: context.textTheme.bodySmall)

// Labels
Text('Large Label', style: context.textTheme.labelLarge)
Text('Medium Label', style: context.textTheme.labelMedium)
Text('Small Label', style: context.textTheme.labelSmall)
```

### Cards and Containers

```dart
// Card with theme styling
Card(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Card content'),
  ),
)

// Container with surface color
Container(
  color: context.colors.surface,
  child: Text('Surface container'),
)

// Container with background color
Container(
  color: context.colors.surfaceContainerLowest,
  child: Text('Background container'),
)
```

## Design Guidelines

### Color Usage Rules

1. **Primary Color (Golden Yellow)**
   - Use for main actions and navigation
   - AppBar background
   - Primary buttons
   - Active states
   - Call-to-action elements

2. **Secondary Color (Royal Blue)**
   - Use for accents and highlights
   - Secondary actions
   - Complementary elements
   - Supporting UI elements

3. **Background Colors**
   - Light gray for screen backgrounds
   - White for cards and elevated surfaces

4. **Text Colors**
   - Dark gray for primary text
   - Muted gray for secondary text and subtitles

### Accessibility

- All color combinations meet WCAG AA contrast requirements
- Text remains readable on all background colors
- Interactive elements have sufficient color contrast

### Consistency

- Always use theme colors instead of hardcoded colors
- Use the provided text styles for consistency
- Follow Material 3 design principles

## File Structure

```
core/
├── constants/
│   └── app_colors.dart      # Color constants
└── theme/
    ├── app_theme.dart       # Main theme configuration
    └── README.md           # This documentation
```

## Best Practices

1. **Use Theme Context**: Always access colors through `Theme.of(context)`
2. **Extension Methods**: Use the provided extension methods for cleaner code
3. **Consistent Spacing**: Use `AppConstants` for consistent spacing
4. **Material 3**: Follow Material 3 design guidelines
5. **Dark Mode Ready**: Theme is prepared for future dark mode implementation
