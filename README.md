# 📱 Randevum Mobile

White-label appointment management system built with Flutter, GetX, and MVVM architecture.

## ✨ Features

- 🎨 **Matrix/Cyberpunk Theme** - Emerald/Green color palette with glassmorphism effects
- 🏗️ **MVVM Architecture** - Clean separation with merged Data+Domain layer
- ⚡ **GetX State Management** - Lightweight, reactive state management
- 🌐 **RESTful API Integration** - Dio HTTP client with interceptors
- 📱 **QR Code Scanning** - Quick branch access via QR codes
- 🔔 **Push Notifications** - Firebase Cloud Messaging integration
- 🎯 **Modular Structure** - Easy to extend and maintain

## 🚀 Quick Start

### Prerequisites
- Flutter SDK (>=3.2.0)
- Dart SDK
- Android Studio / Xcode
- VS Code (recommended)

### Installation

1. **Clone the repository**
```bash
git clone <your-repo-url>
cd randevum
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Generate code**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. **Configure environment**
Edit `.env` file:
```env
API_BASE_URL=http://your-api-url.com/api
```

5. **Run the app**
```bash
flutter run
```

## 📁 Project Structure

```
lib/
├── core/                           # Core functionality
│   ├── api/                       # HTTP client & endpoints
│   │   ├── api_client.dart
│   │   └── api_endpoints.dart
│   ├── config/theme/              # Design system
│   │   ├── app_colors.dart       # Matrix color palette
│   │   ├── app_spacing.dart      # 8px grid system
│   │   ├── app_radii.dart        # Border radius
│   │   └── app_theme.dart        # Material theme
│   ├── di/                        # Dependency injection
│   │   └── app_bindings.dart
│   ├── error/                     # Exception handling
│   ├── network/                   # Connectivity check
│   ├── routes/                    # Navigation
│   │   ├── app_routes.dart
│   │   └── app_pages.dart
│   └── utils/                     # Extensions & helpers
├── modules/                       # Feature modules
│   ├── branch/                   # Branch management
│   │   ├── models/
│   │   ├── branch_service.dart
│   │   ├── branch_controller.dart
│   │   └── views/
│   └── appointment/              # Appointment booking
│       ├── models/
│       ├── appointment_service.dart
│       ├── appointment_controller.dart
│       └── views/
├── presentation/                 # Shared UI components
│   └── views/
│       ├── splash/
│       └── onboarding/
└── main.dart                     # App entry point
```

## 🎨 Design System

### Color Palette (Matrix Theme)
```dart
AppColors.emerald500    // Primary: #10B981
AppColors.green500      // Secondary: #22C55E
AppColors.lime500       // Accent: #84CC16
AppColors.bgPrimary     // Background: #000000
AppColors.white90       // Text: rgba(255,255,255,0.9)
```

### Spacing (8px Grid)
```dart
AppSpacing.s2  // 8px
AppSpacing.s4  // 16px
AppSpacing.s6  // 24px
AppSpacing.s8  // 32px
```

### Border Radius
```dart
AppRadii.sm   // 8px
AppRadii.md   // 12px
AppRadii.xl   // 24px
```

## 🏗️ Architecture

**MVVM + GetX Pattern:**

```
View ⇄ GetxController ⇄ Service/Repository ⇄ ApiClient/Local
```

- **Model**: JSON ↔️ Dart classes with json_serializable
- **Service**: API calls + lightweight business logic
- **Controller**: GetX ViewModel managing state
- **View**: Flutter widgets with GetBuilder

## 📦 Key Dependencies

```yaml
get: ^4.6.6                    # State management & routing
dio: ^5.4.0                    # HTTP client
retrofit: ^4.0.3               # Type-safe API client
json_serializable: ^6.7.1      # JSON serialization
hive: ^2.2.3                   # Local storage
firebase_messaging: ^14.7.9    # Push notifications
cached_network_image: ^3.3.1   # Image caching
qr_code_scanner: ^1.0.1        # QR scanning
```

## 🔧 Development

### Code Generation
After modifying models:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Watch mode (auto-generate):
```bash
flutter pub run build_runner watch
```

### Testing
```bash
flutter test
```

### Code Analysis
```bash
flutter analyze
```

### Format Code
```bash
dart format lib/
```

## 📱 Building

### Android
```bash
flutter build apk --release
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## 🎯 Roadmap

- [x] Core architecture setup
- [x] Branch landing page
- [x] QR code scanning
- [ ] Service selection
- [ ] Staff selection
- [ ] Date/time picker
- [ ] Guest information form
- [ ] Booking confirmation
- [ ] Appointment tracking
- [ ] Staff dashboard
- [ ] Owner dashboard
- [ ] Push notifications
- [ ] Offline support

## 📚 Documentation

- [Setup Guide](SETUP.md) - Detailed setup instructions
- [Project Structure](PROJECT_STRUCTURE.md) - Architecture overview
- [Design Guidelines](.kiro/steering/design-guidelines.md) - UI/UX rules
- [Project Rules](.kiro/steering/project-rules.md) - Development guidelines

## 🤝 Contributing

1. Follow the MVVM + GetX pattern
2. Use the 8px grid system for spacing
3. Stick to the Matrix/Cyberpunk color palette
4. Write clean, documented code
5. Run `flutter analyze` before committing

## 📄 License

This project is proprietary and confidential.

---

Built with ❤️ using Flutter & GetX
