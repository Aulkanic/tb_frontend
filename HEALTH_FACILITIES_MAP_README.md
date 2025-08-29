# Health Facilities Map Feature

This Flutter feature displays health facilities in Davao City on a Google Map with interactive markers and detailed information cards.

## Features

- **Interactive Google Map** with 19 health facilities in Davao City
- **Red pin markers** for each facility
- **Bottom info card** with facility details (name, address, email)
- **Two action buttons**:
  - "View Contacts" - Navigates to a contacts page
  - "See Directions" - Opens Google/Apple Maps for turn-by-turn navigation
- **Location permission handling** with graceful fallbacks
- **Modern UI** with rounded corners, shadows, and brand gradient

## Setup Instructions

### 1. Google Maps API Key

You need to set up Google Maps API keys for both Android and iOS:

#### Android Setup
1. Get a Google Maps API key from [Google Cloud Console](https://console.cloud.google.com/)
2. Enable the following APIs:
   - Maps SDK for Android
   - Geocoding API
   - Directions API (optional, for in-app routing)
3. Replace `YOUR_GOOGLE_MAPS_API_KEY_HERE` in:
   - `android/app/src/main/AndroidManifest.xml` (line 25)
   - `lib/services/geocoding_helper.dart` (line 6)

#### iOS Setup
1. Get a Google Maps API key from [Google Cloud Console](https://console.cloud.google.com/)
2. Enable the following APIs:
   - Maps SDK for iOS
   - Geocoding API
   - Directions API (optional, for in-app routing)
3. Add your API key to `ios/Runner/AppDelegate.swift` (if using AppDelegate) or configure in your project settings

### 2. Dependencies

All required dependencies are already included in `pubspec.yaml`:
- `google_maps_flutter: ^2.10.1`
- `geolocator: ^14.0.2`
- `url_launcher: ^6.3.1`
- `http: ^1.2.0`

### 3. Permissions

#### Android Permissions
Already configured in `android/app/src/main/AndroidManifest.xml`:
- `ACCESS_FINE_LOCATION`
- `ACCESS_COARSE_LOCATION`
- `INTERNET`

#### iOS Permissions
Already configured in `ios/Runner/Info.plist`:
- `NSLocationWhenInUseUsageDescription`
- `NSLocationAlwaysAndWhenInUseUsageDescription`

## Usage

### Accessing the Map
1. Run the app
2. On the splash screen, tap "Test Health Facilities Map"
3. Grant location permission when prompted
4. The map will load centered on Davao City with all facility markers

### Using the Map
- **Tap any red marker** to see facility details in the bottom card
- **"View Contacts"** button navigates to a placeholder contacts page
- **"See Directions"** button opens the native maps app with directions from your current location
- **My Location button** (if permission granted) centers the map on your current position

## Architecture

### File Structure
```
lib/
├── models/
│   └── facility.dart                 # Facility data model
├── services/
│   ├── facility_repository.dart      # Static facility data
│   └── geocoding_helper.dart         # Address to coordinates conversion
├── features/
│   ├── map/
│   │   └── map_screen.dart           # Main map screen
│   └── contacts/
│       └── facility_contacts_page.dart # Placeholder contacts page
└── main.dart                         # App entry point with routes
```

### Key Components

#### Facility Model (`lib/models/facility.dart`)
```dart
class Facility {
  final String name;
  final String address;
  final String email;
  final LatLng? coordinates;
  
  // JSON serialization methods
  factory Facility.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
```

#### Facility Repository (`lib/services/facility_repository.dart`)
- Contains the static list of 19 health facilities in Davao
- Provides methods to get all facilities and facilities with coordinates

#### Geocoding Helper (`lib/services/geocoding_helper.dart`)
- Converts facility addresses to coordinates using Google Geocoding API
- Includes in-memory caching to avoid repeated API calls
- Handles errors gracefully

#### Map Screen (`lib/features/map/map_screen.dart`)
- Main screen with Google Maps integration
- Handles location permissions and current location
- Manages markers and bottom info card
- Implements navigation to contacts page and external maps

## Data Source

The app uses the following 19 health facilities in Davao City:

1. AGDAO*
2. BAGUIO (MALAGOS HC)
3. BUHANGIN (NHA BUHANGIN HC)
4. BUNAWAN*
5. CALINAN*
6. DAVAO CHEST CENTER*
7. DISTRICT A (TOMAS CLAUDIO HC)
8. DISTRICT B (EL RIO HC)
9. DISTICT C (MINIFOREST HC)
10. DISTRICT D (JACINTO HC)
11. MARILOG (MARAHAN HC)
12. PAQUIBATO (MALABOG HC)
13. SASA
14. TALOMO CENTRAL (GSIS HC)
15. TALOMO NORTH (SIR HC)
16. TALOMO SOUTH (PUAN HC)
17. TORIL A
18. TORIL B
19. TUGBOK

Each facility includes:
- Name
- Address
- Email address

## Error Handling

The app handles various error scenarios gracefully:

1. **Location Permission Denied**: Shows a non-blocking banner and continues with map functionality
2. **Geocoding Failures**: Skips markers for addresses that can't be geocoded
3. **Network Errors**: Logs errors and continues with available data
4. **Maps App Not Available**: Shows error message if external maps can't be opened

## Testing

### Manual Testing Checklist
- [ ] App launches without crashes
- [ ] Location permission request appears
- [ ] Map loads centered on Davao City
- [ ] All 19 facility markers are visible (red pins)
- [ ] Tapping a marker shows the bottom info card
- [ ] "View Contacts" navigates to contacts page
- [ ] "See Directions" opens external maps app
- [ ] My Location button works (if permission granted)
- [ ] App handles location permission denial gracefully

### Known Limitations
- Geocoding requires internet connection
- External maps app must be installed for directions
- Some facility addresses may not geocode accurately

## Troubleshooting

### Common Issues

1. **Map not loading**: Check Google Maps API key configuration
2. **No markers visible**: Check internet connection and geocoding API key
3. **Location not working**: Verify location permissions in device settings
4. **Directions not opening**: Ensure Google Maps or Apple Maps is installed

### Debug Information
The app logs geocoding results and errors to the console:
- ✅ Successful geocoding: `Geocoded: [address] → [coordinates]`
- ❌ Failed geocoding: `Geocoding failed for: [address] - Status: [status]`

## Future Enhancements

Potential improvements for production:
1. **Offline support** with cached coordinates
2. **Search functionality** for facilities
3. **Filtering options** by district or facility type
4. **In-app routing** with polylines using Directions API
5. **Facility photos** and additional details
6. **User reviews and ratings**
7. **Appointment booking integration**
