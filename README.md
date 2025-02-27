# weather_app

### Overview
The Weather app is a Flutter-based mobile application that displays weather conditions in a default location. Users can manually search for a location to view the current weather conditions. The weather condition is broken down in an hourly graph chart representation.

### Features
- Location search functionality
- Current weather display with animated icons
- Hourly forecast graph using fl_chart
- Pull-to-refresh functionality

### Technologies Used
- **Flutter & Dart**: Core framework for cross-platform development
- **MVC Pattern**: GetX for State management solution for handling app logic
- **GetStorage**: Local data persistence
- **fl_chart**: Chart visualization for expense analytics
- **UUID**: Unique identifier generation for expenses

### Architecture
The app follows a clean architecture pattern with:

- **MVC**: Business logic and state management
- **UI**: Presentation layer with widgets and screens
- **Repositories**: Data handling and storage logic

## Mediat Attachement: MP4

https://github.com/user-attachments/assets/add538b0-4ddc-43a6-9b02-2454b3a60127

## Project Structure

lib/
  ├── controllers/
  │   └── home_controller.dart
  ├── widgets/
  │   ├── animated_weather_icon.dart
  │   └── hourly_forecast_graph.dart
  ├── views/
  │   └── home_page.dart
  └── main.dart
  └── assets/
      └── gif/

## Dependencies

dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.5
  http: ^0.13.5
  fl_chart: ^0.55.0



