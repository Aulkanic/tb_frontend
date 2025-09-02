#!/usr/bin/env python3
"""
Environment Setup Script for Flutter Map Project
This script helps set up the required environment variables and API keys.
"""

import os
import re
import sys

def create_env_file():
    """Create .env file from template"""
    env_content = """# Ollama Configuration
OLLAMA_BASE_URL=http://localhost:11434
OLLAMA_MODEL=llama3.1

# Google Maps API Key (REQUIRED for maps to work)
GOOGLE_MAPS_API_KEY=your_actual_google_maps_api_key_here

# Firebase Configuration (if needed)
FIREBASE_PROJECT_ID=your_firebase_project_id_here

# Other API Keys
API_KEY=your_actual_api_key_here
SECRET_KEY=your_actual_secret_key_here

# Environment
ENVIRONMENT=development
"""
    
    if os.path.exists('.env'):
        print("⚠️  .env file already exists. Skipping creation.")
        return
    
    with open('.env', 'w') as f:
        f.write(env_content)
    
    print("✅ Created .env file")
    print("📝 Please edit .env and add your actual API keys")

def update_android_api_key():
    """Update Android strings.xml with API key from .env"""
    if not os.path.exists('.env'):
        print("❌ .env file not found. Please run setup first.")
        return
    
    # Read API key from .env
    api_key = None
    with open('.env', 'r') as f:
        for line in f:
            if line.startswith('GOOGLE_MAPS_API_KEY='):
                api_key = line.split('=', 1)[1].strip()
                break
    
    if not api_key or api_key == 'your_actual_google_maps_api_key_here':
        print("❌ Please set a valid GOOGLE_MAPS_API_KEY in your .env file")
        return
    
    # Update strings.xml
    strings_path = 'android/app/src/main/res/values/strings.xml'
    if not os.path.exists(strings_path):
        print(f"❌ {strings_path} not found")
        return
    
    with open(strings_path, 'r') as f:
        content = f.read()
    
    # Replace placeholder with actual API key
    updated_content = re.sub(
        r'<string name="google_maps_api_key">.*?</string>',
        f'<string name="google_maps_api_key">{api_key}</string>',
        content
    )
    
    with open(strings_path, 'w') as f:
        f.write(updated_content)
    
    print(f"✅ Updated {strings_path} with API key: {api_key[:10]}...")

def main():
    print("🚀 Flutter Map Project Environment Setup")
    print("=" * 50)
    
    # Check if .env exists
    if not os.path.exists('.env'):
        print("📁 Creating .env file...")
        create_env_file()
        print("\n📋 Next steps:")
        print("1. Edit .env file and add your Google Maps API key")
        print("2. Run this script again to update Android configuration")
        print("3. Run: flutter clean && flutter pub get")
        print("4. Run: flutter run")
        return
    
    # Check if API key is set
    with open('.env', 'r') as f:
        env_content = f.read()
        if 'your_actual_google_maps_api_key_here' in env_content:
            print("⚠️  Please edit .env file and set your actual Google Maps API key")
            print("Then run this script again.")
            return
    
    # Update Android configuration
    print("🔧 Updating Android configuration...")
    update_android_api_key()
    
    print("\n🎉 Setup complete!")
    print("Next steps:")
    print("1. Run: flutter clean")
    print("2. Run: flutter pub get") 
    print("3. Run: flutter run")

if __name__ == "__main__":
    main()
