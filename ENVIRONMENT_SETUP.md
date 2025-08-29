# Environment Variables Setup

This project uses environment variables to securely manage API keys and configuration settings.

## Setup Instructions

### 1. Copy the Environment Template

Copy the `.env.example` file to create your own `.env` file:

```bash
cp .env.example .env
```

### 2. Configure Your API Keys

Edit the `.env` file and replace the placeholder values with your actual API keys:

```env
# Ollama Configuration
OLLAMA_BASE_URL=http://localhost:11434
OLLAMA_MODEL=llama3.1

# Google Maps API Key (if you're using Google Maps)
GOOGLE_MAPS_API_KEY=your_actual_google_maps_api_key_here

# Firebase Configuration (if needed)
FIREBASE_PROJECT_ID=your_firebase_project_id_here

# Other API Keys
API_KEY=your_actual_api_key_here
SECRET_KEY=your_actual_secret_key_here

# Environment
ENVIRONMENT=development
```

### 3. Security Notes

- **Never commit your `.env` file to version control**
- The `.env` file is already added to `.gitignore`
- Only the `.env.example` file is tracked in git as a template
- Keep your API keys secure and don't share them publicly

### 4. Using Environment Variables in Code

The project includes a `ConfigService` class that provides easy access to environment variables:

```dart
import 'services/config_service.dart';

// Get API keys
String? apiKey = ConfigService.apiKey;
String? googleMapsKey = ConfigService.googleMapsApiKey;

// Get configuration
String ollamaUrl = ConfigService.ollamaBaseUrl;
String model = ConfigService.ollamaModel;

// Check environment
bool isDev = ConfigService.isDevelopment;
bool isProd = ConfigService.isProduction;
```

### 5. Adding New Environment Variables

1. Add the variable to your `.env` file
2. Add it to `.env.example` as a placeholder
3. Add a getter method to `ConfigService` class
4. Use the getter in your code

### 6. Different Environments

You can create different environment files for different environments:

- `.env.development` - Development environment
- `.env.staging` - Staging environment  
- `.env.production` - Production environment

All these files are automatically ignored by git.

## Troubleshooting

- Make sure the `.env` file is in the root directory of your project
- Verify that `flutter_dotenv` is added to your `pubspec.yaml` dependencies
- Ensure the `.env` file is included in the assets section of `pubspec.yaml`
- Check that `ConfigService.initialize()` is called before using any environment variables

## Google Maps API Key Setup

### 1. Get a Google Maps API Key

1. Go to the [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select an existing one
3. Enable the Maps SDK for Android and Maps SDK for iOS
4. Create credentials (API Key)
5. Copy your API key

### 2. Update Your Environment Variables

Add your Google Maps API key to your `.env` file:

```env
GOOGLE_MAPS_API_KEY=AIzaSyYourActualApiKeyHere
```

### 3. Update Android Configuration

Run the API key update script:

```bash
dart update_api_key.dart
```

This will automatically update the Android configuration with your API key.

### 4. For iOS (if needed)

If you're also targeting iOS, you'll need to add the API key to your iOS configuration:

1. Open `ios/Runner/AppDelegate.swift`
2. Add the following before `return super.application(application, didFinishLaunchingWithOptions: launchOptions)`:

```swift
GMSServices.provideAPIKey("YOUR_GOOGLE_MAPS_API_KEY_HERE")
```

### 5. Clean and Rebuild

```bash
flutter clean
flutter pub get
flutter run
```
