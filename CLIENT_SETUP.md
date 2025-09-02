# 🗺️ Client Setup Guide - Getting Maps Working

## 🚨 **IMPORTANT: Maps Won't Work Without This Setup!**

If you've cloned this Flutter project and the maps are not working, follow this guide step by step.

## 🔑 **Step 1: Get a Google Maps API Key**

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select an existing one
3. Enable these APIs:
   - **Maps SDK for Android**
   - **Maps SDK for iOS** (if targeting iOS)
4. Go to **Credentials** → **Create Credentials** → **API Key**
5. Copy your API key (starts with `AIzaSy...`)

## 📁 **Step 2: Set Up Environment Variables**

### Option A: Use the Setup Script (Recommended)
```bash
# Run the setup script
python setup_environment.py

# Edit the .env file with your API key
# Then run the script again to update Android config
python setup_environment.py
```

### Option B: Manual Setup
1. Create a `.env` file in the project root:
```bash
# Create .env file
GOOGLE_MAPS_API_KEY=AIzaSyYourActualApiKeyHere
```

2. Update `android/app/src/main/res/values/strings.xml`:
```xml
<string name="google_maps_api_key">AIzaSyYourActualApiKeyHere</string>
```

## 🧹 **Step 3: Clean and Rebuild**

```bash
flutter clean
flutter pub get
flutter run
```

## ✅ **Verification**

After setup, you should see:
- Maps loading properly
- No "Maps API key not found" errors
- Location services working

## 🆘 **Common Issues & Solutions**

### Issue: "Maps API key not found"
**Solution:** Make sure you've added the API key to both `.env` and `strings.xml`

### Issue: "This app won't run unless you update Google Play services"
**Solution:** Update Google Play Services on your device/emulator

### Issue: Maps show but are blank
**Solution:** Check if your API key has billing enabled and proper restrictions

### Issue: Location not working
**Solution:** Grant location permissions to the app

## 📱 **Platform-Specific Notes**

### Android
- API key is configured in `strings.xml`
- Make sure Google Play Services is up to date

### iOS
- API key should be configured in `ios/Runner/AppDelegate.swift`
- Location permissions are already configured

## 🔒 **Security Notes**

- **Never commit your `.env` file** (it's already in `.gitignore`)
- Keep your API key secure
- Consider setting up API key restrictions in Google Cloud Console

## 📞 **Need Help?**

If you're still having issues:
1. Check the console output for error messages
2. Verify your API key is correct
3. Ensure you've enabled the correct Google Maps APIs
4. Make sure billing is enabled on your Google Cloud project

---

**Remember:** The maps will NOT work until you complete this setup. This is normal and expected for security reasons.
