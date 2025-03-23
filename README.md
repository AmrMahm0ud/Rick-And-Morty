# Rick and Morty Flutter App

## Overview
This is a Flutter application based on the **Rick and Morty** universe, built using **Clean Architecture** principles. It utilizes **Flutter Bloc** for state management and **Hive** for local data storage.

## Project Demo
[![Watch the demo](https://drive.google.com/file/d/1uPYdM1HR3emqrXX-mxU5R6stirzXUDY5/view?usp=sharing)

## Features
- Fetch and display character information from an API.
- Filter and search characters.
- Mark characters as favorites and store them locally using Hive.
- Responsive and scalable UI.

## Tech Stack
- **Flutter** (Version: 3.19.3)
- **Dart** (Version: 3.31)
- **Flutter Bloc** for state management.
- **Hive** for local database storage.
- **Dependency Injection** using GetIt.
- **Dio** for handling API requests.

## Architecture
This project follows **Clean Architecture**, ensuring:
- Separation of concerns.
- Scalability and maintainability.
- Testability.

### Layers:
1. **Presentation Layer** → UI & Bloc (State Management)
2. **Domain Layer** → Business Logic & Use Cases
3. **Data Layer** → API & Local Database (Hive)

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/AmrMahm0ud/Rick-And-Morty.git
   cd your-project-folder
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Run the app:
   ```sh
   flutter run
   ```

## Folder Structure
```
lib/
│── core/              # Common utilities and base classes
│── data/              # Data sources (API & Local DB)
│── domain/            # Business logic and use cases
│── presentation/      # UI & State management (Bloc)
│── config/            # App configuration (Routes, Theme, etc.)
```

## Running Tests
To run unit tests:
```sh
flutter test
```


