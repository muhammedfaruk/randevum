# 🛠️ Quick Command Reference

## 📦 Package Management

```bash
# Install dependencies
flutter pub get

# Update dependencies
flutter pub upgrade

# Check outdated packages
flutter pub outdated

# Clean and reinstall
flutter clean
flutter pub get
```

## 🔨 Code Generation

```bash
# Generate once
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (auto-generate on file changes)
flutter pub run build_runner watch --delete-conflicting-outputs

# Clean generated files
flutter pub run build_runner clean
```

## 🚀 Running

```bash
# Run on default device
flutter run

# Run with hot reload
flutter run --hot

# Run on specific device
flutter devices
flutter run -d <device-id>

# Run in release mode
flutter run --release

# Run with flavor
flutter run --flavor dev
flutter run --flavor prod
```

## 🏗️ Building

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release

# macOS
flutter build macos --release
```

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run with coverage
flutter test --coverage

# View coverage report
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## 🔍 Analysis & Formatting

```bash
# Analyze code
flutter analyze

# Format code
dart format lib/

# Fix formatting
dart format --fix lib/

# Check formatting
dart format --set-exit-if-changed lib/
```

## 🧹 Cleaning

```bash
# Clean build files
flutter clean

# Clean and rebuild
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs

# Remove generated files
find . -name "*.g.dart" -delete
find . -name "*.freezed.dart" -delete
```

## 📱 Device Management

```bash
# List connected devices
flutter devices

# List emulators
flutter emulators

# Launch emulator
flutter emulators --launch <emulator-id>

# Android specific
adb devices
adb logcat

# iOS specific
xcrun simctl list
```

## 🐛 Debugging

```bash
# Run with debug logging
flutter run --verbose

# Attach to running app
flutter attach

# Take screenshot
flutter screenshot

# Profile performance
flutter run --profile
```

## 📊 Performance

```bash
# Analyze app size
flutter build apk --analyze-size
flutter build appbundle --analyze-size

# Profile build
flutter build apk --profile

# Check performance
flutter run --profile
```

## 🔧 Configuration

```bash
# Check Flutter installation
flutter doctor

# Check detailed info
flutter doctor -v

# Update Flutter
flutter upgrade

# Switch Flutter channel
flutter channel stable
flutter channel beta
```

## 📝 Project Info

```bash
# Show project info
flutter pub deps

# Show dependency tree
flutter pub deps --tree

# Show outdated packages
flutter pub outdated
```

## 🎨 Assets

```bash
# Generate app icons
flutter pub run flutter_launcher_icons:main

# Generate splash screens
flutter pub run flutter_native_splash:create
```

## 🌐 Web Specific

```bash
# Run web app
flutter run -d chrome

# Build web app
flutter build web --release

# Serve web app locally
cd build/web
python3 -m http.server 8000
```

## 📱 Platform Specific

### Android
```bash
# Build APK
flutter build apk --release

# Build App Bundle
flutter build appbundle --release

# Install on device
flutter install

# Run on Android
flutter run -d android
```

### iOS
```bash
# Build iOS
flutter build ios --release

# Run on iOS
flutter run -d ios

# Open Xcode
open ios/Runner.xcworkspace
```

## 🔐 Signing & Release

### Android
```bash
# Generate keystore
keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload

# Build signed APK
flutter build apk --release

# Build signed App Bundle
flutter build appbundle --release
```

### iOS
```bash
# Archive for App Store
flutter build ios --release
open ios/Runner.xcworkspace
# Then: Product > Archive in Xcode
```

## 🚀 Quick Development Workflow

```bash
# 1. Start fresh
flutter clean
flutter pub get

# 2. Generate code
flutter pub run build_runner build --delete-conflicting-outputs

# 3. Run app
flutter run

# 4. Make changes and hot reload (press 'r' in terminal)

# 5. Before commit
flutter analyze
dart format lib/
flutter test
```

## 🎯 Common Tasks

### Add New Model
```bash
# 1. Create model file with @JsonSerializable()
# 2. Generate code
flutter pub run build_runner build --delete-conflicting-outputs
```

### Add New Screen
```bash
# 1. Create screen file
# 2. Create controller
# 3. Add route in app_routes.dart
# 4. Add page in app_pages.dart
# 5. Run app
flutter run
```

### Update Dependencies
```bash
flutter pub upgrade
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Fix Build Issues
```bash
flutter clean
flutter pub get
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

## 💡 Tips

- Use `r` for hot reload during development
- Use `R` for hot restart
- Use `q` to quit the app
- Use `p` to show performance overlay
- Use `o` to toggle platform (iOS/Android)
- Use `w` to dump widget hierarchy
- Use `t` to dump rendering tree

## 🔗 Useful Links

- Flutter Docs: https://flutter.dev/docs
- Pub.dev: https://pub.dev
- GetX Docs: https://pub.dev/packages/get
- Dio Docs: https://pub.dev/packages/dio
