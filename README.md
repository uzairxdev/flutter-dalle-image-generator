# DALL-E Image Generator App

This repository contains a Flutter application for generating images using the DALL-E API from OpenAI. Users can input a text description, and the app will generate an image based on the description using the DALL-E image generation capabilities.

## Features

- Input text description for the desired image.
- Generate images using the DALL-E API.
- Display the generated image within the app.
- Handle loading states and error messages.

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: [Included with Flutter](https://flutter.dev/docs/get-started/install)

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/uzairxdev/flutter-dalle-image-generator.git
    cd flutter-dalle-image-generator
    ```

2. Get the dependencies:

    ```bash
    flutter pub get
    ```

3. Replace the OpenAI API key with your own in `lib/image_generator_screen.dart`:

    ```dart
    'Authorization': 'Bearer YOUR_API_KEY_HERE',
    ```

### Running the App

### Demo
https://github.com/uzairxdev/flutter-dalle-image-generator/assets/117645470/1f4d1b06-f424-42dc-a544-ce9173371fa3

Run the app using the following command:

```bash
flutter run

#### Flutter Structure
lib/
├── main.dart
└── image_generator_screen.dart

## Contributing
Contributions are welcome! Please open an issue or submit a pull request.



