# Randevum Mobile - Project Structure

## Architecture
GetX + MVVM with merged Data+Domain layer for simplified development.

## Folder Structure
```
lib/
├── core/
│   ├── api/
│   │   ├── api_client.dart          # Dio HTTP client
│   │   └── api_endpoints.dart       # API endpoint constants
│   ├── config/
│   │   └── theme/
│   │       ├── app_colors.dart      # Matrix/Cyberpunk color palette
│   │       ├── app_spacing.dart     # 8px grid spacing
│   │       ├── app_radii.dart       # Border radius constants
│   │       └── app_theme.dart       # Material theme config
│   ├── di/
│   │   └── app_bindings.dart        # GetX dependency injection
│   ├── error/
│   │   └── exceptions.dart          # Custom exceptions
│   ├── network/
│   │   └── network_info.dart        # Connectivity check
│   ├── routes/
│   │   ├── app_routes.dart          # Route constants
│   │   └── app_pages.dart           # GetX page definitions
│   └── utils/
│       └── extensions.dart          # Utility extensions
├── modules/
│   ├── branch/
│   │   ├── models/
│   │   │   └── branch_model.dart
│   │   ├── branch_service.dart      # API + business logic
│   │   ├── branch_controller.dart   # GetX controller (ViewModel)
│   │   └── views/
│   │       └── branch_landing_screen.dart
│   └── appointment/
│       ├── models/
│       │   ├── appointment_model.dart
│       │   └── time_slot_model.dart
│       ├── appointment_service.dart
│       ├── appointment_controller.dart
│       └── views/
│           └── (booking flow screens)
├── presentation/
│   └── views/
│       ├── splash/
│       │   └── splash_screen.dart
│       └── onboarding/
│           └── qr_scanner_screen.dart
└── main.dart
```

## Key Features
- **GetX State Management**: Lightweight, reactive state management
- **MVVM Pattern**: Clear separation between UI and business logic
- **Merged Data+Domain**: Single layer for services/repositories
- **Matrix Theme**: Emerald/Green cyberpunk design system
- **8px Grid System**: Consistent spacing throughout
- **JSON Serialization**: Auto-generated model serialization

## Next Steps
1. Run `flutter pub get` to install dependencies
2. Run `flutter pub run build_runner build` to generate JSON serialization
3. Update `.env` with your API base URL
4. Add more modules (staff, auth, etc.) following the same pattern

## Development Commands
```bash
# Get dependencies
flutter pub get

# Generate code (JSON serialization)
flutter pub run build_runner build --delete-conflicting-outputs

# Run app
flutter run

# Build for production
flutter build apk --release
flutter build ios --release
```

## Design Guidelines
- Use `AppColors` for all colors (emerald/green theme)
- Follow `AppSpacing` for all padding/margins (8px grid)
- Use `AppRadii` for border radius
- Implement glassmorphism effects for cards
- Keep animations smooth (200-500ms)
