# Randevum Mobile - Setup Guide

## ✅ Project Created Successfully!

Your Flutter project is now set up with:
- ✅ GetX state management
- ✅ MVVM architecture (merged Data+Domain)
- ✅ Matrix/Cyberpunk theme (Emerald/Green)
- ✅ Core modules (Branch, Appointment)
- ✅ JSON serialization configured
- ✅ Network layer with Dio
- ✅ Routing with GetX

## 🚀 Quick Start

### 1. Dependencies (Already Done)
```bash
flutter pub get
```

### 2. Generate Code (Already Done)
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. Configure Environment
Edit `.env` file with your API URL:
```
API_BASE_URL=http://your-api-url.com/api
```

### 4. Run the App
```bash
# Run on connected device/emulator
flutter run

# Run on specific device
flutter devices
flutter run -d <device-id>

# Run with hot reload
flutter run --hot
```

## 📁 Project Structure

```
lib/
├── core/                    # Core functionality
│   ├── api/                # HTTP client & endpoints
│   ├── config/theme/       # Design system
│   ├── di/                 # Dependency injection
│   ├── routes/             # Navigation
│   └── utils/              # Extensions & helpers
├── modules/                # Feature modules
│   ├── branch/            # Branch management
│   └── appointment/       # Appointment booking
├── presentation/          # Shared UI components
└── main.dart             # App entry point
```

## 🎨 Design System

### Colors (Matrix Theme)
- Primary: Emerald (#10B981)
- Secondary: Green (#22C55E)
- Accent: Lime (#84CC16)
- Background: Black (#000000)

### Spacing (8px Grid)
Use `AppSpacing` constants:
- s2 = 8px
- s4 = 16px
- s6 = 24px
- s8 = 32px

### Border Radius
Use `AppRadii` constants:
- sm = 8px
- md = 12px
- xl = 24px

## 🔧 Development Commands

```bash
# Install dependencies
flutter pub get

# Generate code (after model changes)
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (auto-generate on changes)
flutter pub run build_runner watch

# Clean build
flutter clean
flutter pub get

# Run tests
flutter test

# Analyze code
flutter analyze

# Format code
dart format lib/

# Build APK
flutter build apk --release

# Build iOS
flutter build ios --release
```

## 📱 Adding New Modules

Follow this pattern for each module:

```
lib/modules/your_module/
├── models/
│   └── your_model.dart          # Add @JsonSerializable()
├── your_service.dart            # API calls + business logic
├── your_controller.dart         # GetX controller (ViewModel)
└── views/
    └── your_screen.dart         # UI screens
```

### Example: Adding a Service Module

1. **Create Model**
```dart
@JsonSerializable()
class ServiceModel {
  final int id;
  final String name;
  // ... fields
  
  factory ServiceModel.fromJson(Map<String, dynamic> json) => 
    _$ServiceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}
```

2. **Create Service**
```dart
class ServiceService {
  final ApiClient api;
  final NetworkInfo network;
  
  Future<List<ServiceModel>> getAll(int branchId) async {
    // API call logic
  }
}
```

3. **Create Controller**
```dart
class ServiceController extends GetxController {
  final ServiceService service;
  
  List<ServiceModel> services = [];
  bool loading = false;
  
  Future<void> fetchAll(int branchId) async {
    loading = true;
    update(['services']);
    services = await service.getAll(branchId);
    loading = false;
    update(['services']);
  }
}
```

4. **Create View**
```dart
class ServiceSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServiceController>(
      id: 'services',
      builder: (controller) {
        if (controller.loading) return CircularProgressIndicator();
        return ListView.builder(...);
      },
    );
  }
}
```

5. **Register in Routes**
```dart
GetPage(
  name: AppRoutes.serviceSelection,
  page: () => ServiceSelectionScreen(),
  binding: BindingsBuilder(() {
    Get.put(ServiceController(Get.find<ServiceService>()));
  }),
)
```

6. **Run Code Generation**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## 🎯 Next Steps

1. **Add More Modules**
   - Service selection
   - Staff selection
   - Date/time picker
   - Guest info form
   - Booking confirmation
   - Appointment tracking

2. **Implement Authentication**
   - Staff login
   - Owner login
   - Token management

3. **Add Firebase**
   - Push notifications
   - Analytics
   - Crashlytics

4. **Enhance UI**
   - Glassmorphism effects
   - Animations
   - Loading states
   - Error handling

5. **Testing**
   - Unit tests for services
   - Widget tests for screens
   - Integration tests

## 🐛 Troubleshooting

### Build Runner Issues
```bash
flutter clean
flutter pub get
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### GetX Navigation Issues
Make sure you're using `Get.toNamed()` instead of `Navigator.push()`

### Theme Not Applied
Check that you're using `GetMaterialApp` instead of `MaterialApp`

## 📚 Resources

- [GetX Documentation](https://pub.dev/packages/get)
- [Flutter Documentation](https://flutter.dev/docs)
- [Dio HTTP Client](https://pub.dev/packages/dio)
- [JSON Serialization](https://pub.dev/packages/json_serializable)

---

Happy coding! 🚀
