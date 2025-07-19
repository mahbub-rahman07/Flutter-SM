# Flutter TODO App – State Management Example

This project is a simple TODO application built with Flutter, demonstrating best practices in state management using the BLoC pattern, dependency injection, and clean architecture principles.

## Features
- Add, update, and delete TODO items
- State management with BLoC (`flutter_bloc`)
- Dependency injection with `get_it`
- App lifecycle handling with `get`
- Clean separation of presentation, domain, and data layers

## Project Structure
```plaintext
lib/
└── example_bloc/
    ├── core/
    │   ├── app_bloc_observer.dart        # BLoC observer for debugging
    │   ├── app_lifecycle_handler.dart    # App lifecycle management
    │   └── di.dart                       # Dependency injection setup
    └── feature/
        └── todo/
            ├── data/
            │   ├── models/               # Data models
            │   └── repository/           # Repository implementation
            ├── domain/
            │   ├── entities/             # Entity definitions
            │   ├── repositories/         # Repository contracts
            │   └── usecases/             # Business logic (use cases)
            └── presentation/
                ├── bloc/                 # BLoC, events, states
                └── view/                 # UI screens
main.dart                                 # App entry point
```
## How It Works
- **State Management:** Uses the BLoC pattern (`flutter_bloc`) to manage UI state and business logic.
- **Dependency Injection:** All dependencies (repositories, use cases, BLoC) are registered in `core/di.dart` using `get_it`.
- **Lifecycle Handling:** `AppLifecycleHandler` (with `get`) tracks app lifecycle events.
- **Repository Pattern:** The data layer uses an in-memory repository for TODO items, simulating async operations.
- **UI:** The main screen (`todo_screen.dart`) allows users to add, update, and delete TODOs. State changes are reflected in real time.

## Packages Used
- [`flutter_bloc`](https://pub.dev/packages/flutter_bloc)
- [`get_it`](https://pub.dev/packages/get_it)
- [`get`](https://pub.dev/packages/get)
- [`equatable`](https://pub.dev/packages/equatable)
- [`uuid`](https://pub.dev/packages/uuid)
- [`freezed_annotation`](https://pub.dev/packages/freezed_annotation)
- [`json_serializable`](https://pub.dev/packages/json_serializable)
- [`freezed`](https://pub.dev/packages/freezed) (dev)
- [`build_runner`](https://pub.dev/packages/build_runner) (dev)

## Getting Started
1. **Clone the repository:**
   ```bash
   git clone <repo-url>
   cd state_management
   ```
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Run the app:**
   ```bash
   flutter run
   ```

## Implementation Details
- The app uses a BLoC (`TodoBloc`) to handle all TODO-related events and state.
- Use cases encapsulate business logic (add, update, delete, fetch all TODOs).
- The repository pattern abstracts data access, making it easy to swap implementations.
- Dependency injection ensures loose coupling and testability.
- The UI is reactive and updates automatically based on BLoC state.

## Folder Highlights
- `lib/example_bloc/feature/todo/presentation/view/todo_screen.dart`: Main UI for the TODO app.
- `lib/example_bloc/feature/todo/presentation/bloc/`: BLoC, events, and states.
- `lib/example_bloc/feature/todo/domain/`: Entities, repositories, and use cases.
- `lib/example_bloc/feature/todo/data/`: Repository implementation and models.
- `lib/example_bloc/core/di.dart`: Dependency injection setup.
- `lib/main.dart`: App entry point and BLoC observer setup.

## License
This project is for educational purposes.
# Flutter-SM
