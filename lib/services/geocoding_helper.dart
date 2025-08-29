import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeocodingHelper {
  static const String _baseUrl = 'https://maps.googleapis.com/maps/api/geocode/json';
  static const String _apiKey = 'AIzaSyBtvTPLbE1vK5Wy9e_mmM2ftKmQN131Z8A'; // Replace with actual API key
  
  // In-memory cache to avoid repeated API calls
  static final Map<String, LatLng> _cache = {};
  
  /// Converts an address to coordinates using Google Geocoding API
  /// Returns null if geocoding fails or address is invalid
  static Future<LatLng?> getCoordinates(String address) async {
    // Check cache first
    if (_cache.containsKey(address)) {
      return _cache[address];
    }
    
    try {
      final encodedAddress = Uri.encodeComponent(address);
      final url = '$_baseUrl?address=$encodedAddress&key=$_apiKey';
      
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        if (data['status'] == 'OK' && data['results'].isNotEmpty) {
          final location = data['results'][0]['geometry']['location'];
          final lat = location['lat'] as double;
          final lng = location['lng'] as double;
          
          final coordinates = LatLng(lat, lng);
          
          // Cache the result
          _cache[address] = coordinates;
          
          print('✅ Geocoded: $address → $coordinates');
          return coordinates;
        } else {
          print('❌ Geocoding failed for: $address - Status: ${data['status']}');
          return null;
        }
      } else {
        print('❌ HTTP error ${response.statusCode} for: $address');
        return null;
      }
    } catch (e) {
      print('❌ Geocoding error for $address: $e');
      return null;
    }
  }
  
  /// Clears the geocoding cache
  static void clearCache() {
    _cache.clear();
  }
  
  /// Returns the number of cached entries
  static int getCacheSize() {
    return _cache.length;
  }
  
  /// Preloads coordinates for a list of addresses
  static Future<void> preloadCoordinates(List<String> addresses) async {
    for (final address in addresses) {
      await getCoordinates(address);
    }
  }
}
