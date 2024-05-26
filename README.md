# DocRater

DocRater is a Flutter application that helps users find trusted doctors tailored to their needs. The codebase is written in Dart and leverages Firebase for authentication and data storage. The app provides a user-friendly interface for searching and displaying information about doctors in various specialties.

## Features

- **Flutter Compatibility**
  The app is compatible with the latest Flutter version (Flutter 3.7.6). To compile the app, you can use the following commands:

  ```
  flutter pub get
  flutter run
  ```

  This will first get the required dependencies and then compile and run the app.

- User authentication with Firebase Authentication
- Search functionality for doctors based on specialty, name, location, and other details
- Displays comprehensive information about each doctor, including degrees, practice days, visiting hours, and contact numbers
- Separate screens for sign-up, login, and displaying categories of doctors
- UI helper utilities for consistent user interface elements across the app

## Prerequisites

Before running the app, ensure you have the following prerequisites installed:

- Dart SDK (version 2.19.4 or later)
- Flutter (version 3.7.6 or later)
- Firebase tools (firebase_tools)

## Getting Started

To set up the app locally, follow these steps:

1. Clone the repository:

   ```
   git clone https://github.com/asifahamed11/DocRater.git
   ```

2. Navigate to the project directory:

   ```
   cd DocRater/
   ```

3. Get the required dependencies:

   ```
   flutter pub get
   ```

4. Set up Firebase for your project by following the official [Firebase documentation](https://firebase.google.com/docs/flutter/setup) and then run the app with:

   ```
   flutter run
   ```

## Screenshots

Here are some screenshots showcasing the app:

<img src="https://github.com/asifahamed11/DocRater/blob/master/screenshots/mainScreenshot.png" alt="Main Screen Screenshot" title="Main Screen Screenshot" width="200"/>

This is the main screen, where the app entry point and Firebase Core initialization occur.

<img src="https://github.com/asifahamed11/DocRater/blob/master/screenshots/homescreenshot.png" alt="Home Screen Screenshot" title="Home Screen Screenshot" width="200"/>

This is the home screen, which serves as the app's entry point and initializes Firebase.

<img src="https://github.com/asifahamed11/DocRater/blob/master/screenshots/signupScreen.png" alt="Sign-up Screen Screenshot" title="Sign-up Screen Screenshot" width="200"/>

This is the sign-up screen, where new users can create accounts.

<img src="https://github.com/asifahamed11/DocRater/blob/master/screenshots/DrListScreen.png" alt="Doctor List Screen Screenshot" title="Doctor List Screen Screenshot" width="200"/>

This screenshot shows the doctor list screen, where users can search for doctors based on category, name, and other details.


## Contributing

Contributions to the project are welcome. If you have any suggestions or have encountered any issues, please open a new issue on the repository's [Issues tracker](https://github.com/asifahamed11/DocRater/issues).

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

**Note:** This app is intended for educational purposes and should not be used as a primary medical resource. Always consult with qualified medical professionals for any healthcare-related concerns.

Repository Link: https://github.com/asifahamed11/DocRater.git
