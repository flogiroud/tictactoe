# TIC TAC TOE

A Flutter implementation of the classic Tic Tac Toe game


https://github.com/user-attachments/assets/596d190c-1825-4599-8095-b253d151b991


## Using FVM (Flutter Version Manager)

This project uses FVM to ensure a consistent Flutter/Dart version. See the official FVM Getting Started guide: [FVM documentation](https://fvm.app/documentation/getting-started).

## Quick start

### 1) Install dependencies

```bash
fvm flutter pub get
```

### 2) Generate code (Freezed, JSON serialization, Riverpod)

```bash
fvm dart run build_runner build --delete-conflicting-outputs
```

### 3) Run the application

```bash
fvm flutter run
```

## Project architecture

The project follows **Clean Architecture** principles with a feature-based organization:

```
lib/
├── main.dart                    # App entry point
├── app.dart                     # Root widget
└── core/                        # Shared resources
    ├── constants/
    ├── errors/                  # Failure types
    ├── extensions/              # Dart extensions
    ├── l10n/
    ├── observers/
    ├── providers/               # Core providers
    ├── router/                  # GoRouter configuration
    ├── services/                # Core services (audio, storage)
    ├── ui/                      # Shared UI accross app
    └── utils/
└── features/                    # Feature modules
    ├── game/                    # Game feature
    │   ├── data/                # Datasources, repositories impl
    │   ├── domain/              # Usecases, entities, logic, etc.
    │   └── presentation/        # Screens, providers, etc.
```

### Architecture layers

Each feature follows Clean Architecture with three distinct layers:

1. **Domain Layer** (`domain/`)
   - **Entities**: Immutable data models using Freezed
   - **Repositories**: Abstract interfaces defining data contracts
   - **Use Cases**: Business logic operations (single responsibility)
   - **Logic**: Pure business rules (GameRules, AI algorithms)

2. **Data Layer** (`data/`)
   - **Data Sources**: Concrete implementations
   - **Repository Implementations**: Bridge between domain and data sources
   - Uses `dartz` for functional error handling

3. **Presentation Layer** (`presentation/`)
   - **Screens**: UI screens
   - **Providers/Notifiers**: Riverpod state management
   - **Widgets**: Feature-specific UI components

### State management & Dependency Injection

- **Riverpod** (with hooks, `riverpod_annotation` and code generation)


### Serialization

- **Freezed + json_serializable**

### Localization

- **Flutter l10n**
  - Supported locales: `en`, `fr`

## Features

### Game modes

- **Local multiplayer**: Two players on the same device
- **AI opponent**: Play against AI (local algorithm) with two difficulty levels:
  - **Easy**: Random move selection
  - **Hard**: Minimax algorithm (unbeatable)

### Game features

- Game state persistence (saved automatically during play)
- Resume saved games
- Win detection (horizontal, vertical, diagonal)
- Draw detection
- Visual feedback (animations, sounds, haptics)
- Winning line highlighting
- Game over dialog

### AI implementation

- **RandomAiPlayer**: Selects random available positions
- **MinimaxAiPlayer**: Implements minimax algorithm
- AI moves have a random delay for realistic gameplay

## Storage

Game state is persisted locally using **SharedPreferences**:

- Games are saved automatically after each move
- Saved games are deleted when a game ends (win/draw)

## Testing

### Running tests

```bash
# Run all tests
fvm flutter test

# Run specific test file
fvm flutter test test/features/game/domain/usecases/save_game_usecase_test.dart
```

### Test helpers

- **MockGameRepository**: Reusable mock for testing use cases and notifiers
- **createTestContainer()**: Helper to create a ProviderContainer with test overrides

## Routing

Navigation is handled by **GoRouter**

## Audio & Haptics

The project uses the [audioplayers](https://pub.dev/packages/audioplayers) package for sound effects and the [gaimon](https://pub.dev/packages/gaimon) package to provide custom haptic feedback.

## UI/UX

- **Custom theme**: Dark theme only
- **Animations**: Custom animation widgets
- **Custom widgets**: Generic components

## Notes

- AI has been used in this project for unit test generation, ai algorithms, code completion and the creation of repetitive boilerplate code
- The app has been developed/tested on iPhone 16 Pro iOS 26.1, and tested on Samsung Galaxy S8+ Android 9
