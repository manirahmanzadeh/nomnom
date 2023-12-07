# NomNom - Food Selling App

NomNom is a food selling app that uses Clean Architecture, BLoC state management, `get_it` dependency injection, and features animated UIs. This project is designed to provide a scalable and maintainable structure for building a robust food shop application.

## Features

- Clean Architecture for code separation and maintainability.
- BLoC (Business Logic Component) state management for handling complex application logic.
- `get_it` dependency injection for managing the app's dependencies.
- Animated UIs to enhance the user experience.

## Project Structure

The project follows a modular and organized structure:

- **lib**
    - **data**: Contains the implementation of data sources, repositories, and models.
    - **domain**: Defines the core business logic, entities, repositories, and use cases.
    - **presentation**: Manages the UI layer, including BLoCs, events, states, and UI components.

## Getting Started

To run the NomNom app locally, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/manirahmanzadeh/nomnom.git

2. Navigate to the project directory:
   
    ```bash
   cd nomnom

3. Install dependencies:

    ```bash
   flutter pub get

4. Run the app:

    ```bash
   flutter run

## Dependencies

NomNom relies on the following key dependencies:

- [flutter_bloc](https://pub.dev/packages/flutter_bloc): State management library for Flutter applications.
- [equatable](https://pub.dev/packages/equatable): Simplifies equality comparisons for Dart objects.
- [get_it](https://pub.dev/packages/get_it): A simple, yet powerful, dependency injection package for Dart and Flutter projects.

  Make sure to check the latest versions of these dependencies on [pub.dev](https://pub.dev/).

## Contributing

We welcome contributions! Please follow our [contribution guidelines](CONTRIBUTING.md) when submitting pull requests.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

NomNom wouldn't be possible without the contributions and support from the open-source community. We appreciate your contributions and feedback.

Happy coding and happy eating with NomNom!
   