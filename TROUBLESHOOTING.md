# 🔧 Troubleshooting Guide - Flutter Maps

## 🚨 **Maps Not Loading - Common Issues & Solutions**

### **Issue 1: "Maps API key not found" Error**
**Symptoms:** App crashes or shows error about missing API key
**Solution:** 
1. Check if `.env` file exists in project root
2. Verify `GOOGLE_MAPS_API_KEY` is set in `.env`
3. Ensure `strings.xml` has the correct API key
4. Run `flutter clean && flutter pub get`

### **Issue 2: Blank/White Maps**
**Symptoms:** Maps area is white/blank, no tiles loading
**Solutions:**
1. **API Key Issues:**
   - Verify API key is correct (starts with `AIzaSy...`)
   - Check if billing is enabled in Google Cloud Console
   - Ensure Maps SDK for Android/iOS is enabled

2. **Network Issues:**
   - Check internet connection
   - Verify firewall isn't blocking Google Maps requests
   - Try on different network (mobile data vs WiFi)

3. **Device/Emulator Issues:**
   - Update Google Play Services (Android)
   - Try on physical device instead of emulator
   - Clear app data and cache

### **Issue 3: "This app won't run unless you update Google Play services"**
**Symptoms:** App shows Google Play Services update dialog
**Solutions:**
1. Update Google Play Services from Play Store
2. Clear Google Play Services cache
3. Try on different device/emulator
4. Ensure emulator has Google Play Services installed

### **Issue 4: Location Not Working**
**Symptoms:** Can't get current location, location permission errors
**Solutions:**
1. **Android:**
   - Grant location permissions in app settings
   - Enable location services in device settings
   - Check if location permission is in AndroidManifest.xml

2. **iOS:**
   - Grant location permissions when prompted
   - Check location settings in iOS Settings app
   - Verify Info.plist has location permission descriptions

### **Issue 5: Build Errors**
**Symptoms:** `flutter run` fails with build errors
**Solutions:**
1. **Clean and rebuild:**
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

2. **Check dependencies:**
   ```bash
   flutter doctor
   flutter pub deps
   ```

3. **Platform-specific issues:**
   - **Android:** Check `build.gradle` and `gradle.properties`
   - **iOS:** Check `Podfile` and run `pod install`

## 🔍 **Debugging Steps**

### **Step 1: Check Console Output**
Look for error messages in:
- Flutter console output
- Android Studio/VS Code debug console
- Device logcat (Android)

### **Step 2: Verify Configuration Files**
1. **`.env` file exists and has API key**
2. **`strings.xml` has correct API key**
3. **`AndroidManifest.xml` has location permissions**
4. **`Info.plist` has location permission descriptions**

### **Step 3: Test API Key**
1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Check if Maps SDK is enabled
3. Verify API key restrictions
4. Check billing status

### **Step 4: Test on Different Devices**
1. Try physical device vs emulator
2. Test on different Android/iOS versions
3. Test on different screen sizes

## 📱 **Platform-Specific Issues**

### **Android Issues**
- **Google Play Services:** Must be up to date
- **API Level:** Ensure minimum SDK version is met
- **Permissions:** Location permissions must be granted
- **Emulator:** Use emulator with Google Play Services

### **iOS Issues**
- **Simulator:** Maps may not work properly in iOS Simulator
- **Physical Device:** Test on actual iOS device
- **Permissions:** Location permissions must be granted
- **Bundle ID:** Ensure bundle ID matches Google Cloud Console

## 🛠️ **Quick Fix Commands**

```bash
# Clean and rebuild
flutter clean
flutter pub get

# Check Flutter installation
flutter doctor

# Check dependencies
flutter pub deps

# Run with verbose logging
flutter run -v

# For iOS, also run:
cd ios && pod install && cd ..
```

## 📞 **When to Get Help**

Contact the developer if:
1. All troubleshooting steps have been tried
2. Error messages are unclear
3. Issue persists across different devices
4. Build errors are complex

**Include in your message:**
- Error messages (copy/paste)
- Device/emulator details
- Flutter version (`flutter --version`)
- Steps you've already tried
- Screenshots if possible

---

**Remember:** Most map issues are related to API key configuration or permissions. Start with the basic setup steps before diving into complex troubleshooting.
