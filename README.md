# Plant App 🌱

A Flutter application for plant identification and care, built with Clean Architecture principles.

## 📋 Table of Contents

- [Features](#features)
- [Architecture](#architecture)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Code Generation](#code-generation)
- [Running the App](#running-the-app)
- [API Configuration](#api-configuration)
- [Naming Conventions](#naming-conventions)
- [Commit Message Convention](#commit-message-convention)
- [Design System](#design-system)

## ✨ Features

- **Onboarding Flow**: Multi-step onboarding with paywall integration
- **Home Screen**: 
  - Plant categories display
  - Questions/Articles section
  - Premium upgrade banner
  - Search functionality
- **Clean Architecture**: Feature-based modular structure
- **State Management**: BLoC pattern for reactive state management
- **Navigation**: Auto-route for type-safe navigation

## 🏗️ Architecture

This project follows **Clean Architecture** principles with feature-based organization:

```
lib/
├── core/           # Core utilities, network, DI, routing
├── features/       # Feature modules (onboarding, home)
│   ├── domain/     # Business logic, entities, repository interfaces
│   ├── data/       # Data sources, models, repository implementations
│   └── presentation/ # UI, BLoC, pages, widgets
└── shared/         # Shared widgets, themes, extensions
```

### Architecture Layers

- **Domain Layer**: Business logic, entities, and repository interfaces
- **Data Layer**: API calls, data models, and repository implementations
- **Presentation Layer**: UI components, BLoC for state management

## 🛠️ Tech Stack

### State Management
- `flutter_bloc` ^8.1.6 - BLoC pattern implementation
- `equatable` ^2.0.5 - Value equality for state objects

### Networking
- `dio` ^5.4.1 - HTTP client for API calls

### Code Generation
- `json_serializable` ^6.7.1 - JSON serialization
- `json_annotation` ^4.8.1 - JSON annotations
- `build_runner` ^2.4.7 - Code generation tool
- `auto_route_generator` ^7.3.0 - Route generation

### Navigation
- `auto_route` ^7.3.2 - Type-safe routing solution

### Dependency Injection
- `get_it` ^7.6.4 - Service locator for DI

### Local Storage
- `shared_preferences` ^2.2.2 - Key-value storage

## 📁 Project Structure

```
lib/
├── core/
│   ├── constants/      # API endpoints, app constants, assets, dimensions
│   ├── di/           # Dependency injection setup
│   ├── network/        # Network manager (Dio wrapper)
│   ├── router/        # Auto-route configuration
│   └── utils/         # Shared utilities (SharedPreferences service)
│
├── features/
│   ├── home/
│   │   ├── data/      # Data layer (models, datasources, repositories)
│   │   ├── domain/    # Domain layer (entities, repository interfaces)
│   │   └── presentation/ # UI layer (BLoC, pages, widgets)
│   │
│   └── onboarding/
│       └── presentation/ # Onboarding flow UI
│
└── shared/
    ├── extensions/    # Widget extensions
    ├── theme/         # Colors, themes
    └── widgets/       # Reusable widgets (PA prefix)
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.5.4 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- iOS development: Xcode (for macOS)

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd plant-app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Generate code (see [Code Generation](#code-generation) section)

4. Run the app:
```bash
flutter run
```

## 🔧 Code Generation

This project uses code generation for:
- JSON serialization (`*.g.dart` files)
- Auto-route generation (`app_router.gr.dart`)

### Generate All Code

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Watch Mode (Auto-regenerate on file changes)

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Clean and Rebuild

```bash
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

**Note**: Always run build_runner after:
- Adding new routes
- Modifying models with `@JsonSerializable()`
- Changing auto_route configuration

## 🏃 Running the App

### Development

```bash
# Run on connected device/emulator
flutter run

# Run on specific device
flutter devices
flutter run -d <device-id>

# Run in release mode
flutter run --release
```

### Build

#### Android
```bash
flutter build apk --release
# or
flutter build appbundle --release
```

#### iOS
```bash
flutter build ios --release
```

### Debug Commands

```bash
# Analyze code
flutter analyze

# Check for outdated packages
flutter pub outdated

# Format code
dart format .

# Run tests
flutter test
```

## 🔌 API Configuration

API configuration is located in `lib/core/constants/api_constants.dart`:

```dart
class ApiConstants {
  static const String baseUrl = 'https://dummy-api-jtg6bessta-ey.a.run.app';
  static const String getCategories = '/getCategories';
  static const String getQuestions = '/getQuestions';
}
```

## 📝 Naming Conventions

### Reusable Widgets: `PA` Prefix
- **Format**: `PA` + WidgetName (e.g., `PAButton`, `PAText`, `PAScaffold`)
- **Why**: 
  - `PA` stands for "Plant App" - clearly identifies project-specific reusable components
  - Prevents naming conflicts with Flutter's built-in widgets
  - Makes it easy to distinguish custom widgets from standard Flutter widgets in imports
  - Ensures consistency across the codebase

### Features: Feature-First Structure
- **Format**: Feature name as top-level folder (e.g., `home/`, `onboarding/`)
- **Why**:
  - Follows Clean Architecture principles
  - Each feature is self-contained with its own domain, data, and presentation layers
  - Makes features easy to locate, test, and potentially extract into separate modules
  - Scales well as the app grows

### BLoC Events: `[Feature]Event[Action]` Format
- **Format**: `HomeEventLoadData`, `OnboardingEventCompleteOnboarding`
- **Why**:
  - Clear naming shows which feature the event belongs to
  - Action name describes what the event does
  - Prevents event name collisions across features
  - Makes code more readable and maintainable

### BLoC States: `[Feature]State[StateName]` Format
- **Format**: `HomeStateLoaded`, `HomeStateLoading`, `HomeStateError`
- **Why**:
  - Consistent pattern makes states easy to identify
  - Feature prefix groups related states together
  - State name clearly describes the current state
  - Helps with debugging and state management

## 📝 Commit Message Convention

This project follows a consistent commit message format for better project history and collaboration.

### Format

```
<Area>: <action> <description>
```

### Components

1. **Area** (Required): The feature or module affected
   - `Home`: Changes related to the home feature
   - `Onboarding`: Changes related to onboarding flow
   - `Develop`: Core/development changes (DI, network, router, shared utilities)

2. **Action** (Required): The type of change
   - `add`: New feature, widget, or functionality
   - `update`: Modifications to existing code
   - `fix`: Bug fixes
   - `refactor`: Code restructuring without changing functionality
   - `remove`: Deletion of code or features

3. **Description** (Required): Brief description of what changed

### Examples

```bash
# Feature additions
Home: add home page
Home: add bottom nav bar
Onboarding: add onboarding page 2

# Updates
Onboarding: update paywall page button actions
Develop: update dependency injection
Develop: update readme

# Fixes
Onboarding: fix page layouts
Develop: fix analyze issues & remove magic numbers

# Multiple changes
Onboarding: update paywall page & add feature icons
```

### Guidelines

- Use present tense ("add" not "added")
- Keep descriptions concise but clear
- Use lowercase for area and action
- Capitalize only the first word of the description (unless it's a proper noun)
- Use `&` for multiple related changes in one commit
- Separate unrelated changes into different commits

### Benefits

- **Easy navigation**: Quickly find commits related to specific features
- **Clear history**: Understand project evolution at a glance
- **Better collaboration**: Team members can easily identify relevant changes
- **Automated tooling**: Can be used for changelog generation

## 🎨 Design System

- **Colors**: Defined in `lib/shared/theme/pa_colors.dart`
- **Text Styles**: Defined in `lib/shared/widgets/pa_text_styles.dart`
- **Dimensions**: Defined in `lib/core/constants/pa_dimens.dart`
- **Assets**: Paths defined in `lib/core/constants/assets.dart`

## 📦 Dependencies

Key dependencies are listed in `pubspec.yaml`. To update:

```bash
flutter pub upgrade
```

## 🤝 Contributing

1. Follow Clean Architecture principles
2. Use BLoC for state management
3. Prefix reusable widgets with `PA`
4. Write meaningful commit messages
5. Run `flutter analyze` before committing

## 📄 License

[Add your license here]

## 👥 Authors

[Add author information here]

---

**Happy Coding! 🌱**
