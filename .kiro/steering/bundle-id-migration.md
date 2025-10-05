---
inclusion: manual
---

# Bundle ID Migration - eRandevu

Uygulama ismi "randevum"dan "eRandevu"ya değiştirildi ve tüm bundle ID'ler güncellendi.

## 📝 Değişiklikler

### 1. Uygulama İsmi
- **Eski**: randevum
- **Yeni**: eRandevu

### 2. Bundle ID / Package Name
- **Eski**: com.example.randevum
- **Yeni**: com.erandevu.app

## 📱 Güncellenen Dosyalar

### Core Files
- ✅ `pubspec.yaml` - Package name: erandevu
- ✅ `pubspec.yaml` - Description güncellendi

### Android
- ✅ `android/app/build.gradle.kts` - namespace ve applicationId
- ✅ `android/app/src/main/AndroidManifest.xml` - App label: eRandevu
- ✅ `android/app/src/main/kotlin/com/erandevu/app/MainActivity.kt` - Package name
- ✅ Eski package klasörü silindi (com/example/randevum)

### iOS
- ✅ `ios/Runner.xcodeproj/project.pbxproj` - PRODUCT_BUNDLE_IDENTIFIER (tüm konfigürasyonlar)
- ✅ `ios/Runner/Info.plist` - CFBundleDisplayName: eRandevu
- ✅ `ios/Runner/Info.plist` - CFBundleName: erandevu

## 🔧 Sonraki Adımlar

### Android
1. Clean build:
   ```bash
   cd android
   ./gradlew clean
   cd ..
   flutter clean
   flutter pub get
   ```

2. Yeni build:
   ```bash
   flutter build apk
   # veya
   flutter build appbundle
   ```

### iOS
1. Clean build:
   ```bash
   cd ios
   rm -rf Pods Podfile.lock
   pod install
   cd ..
   flutter clean
   flutter pub get
   ```

2. Xcode'da:
   - Product > Clean Build Folder
   - Signing & Capabilities'de yeni bundle ID'yi kontrol et
   - Provisioning profile'ı güncelle

3. Yeni build:
   ```bash
   flutter build ios
   ```

## ⚠️ Önemli Notlar

1. **Firebase**: Eğer Firebase kullanıyorsanız:
   - Firebase Console'da yeni bundle ID'yi ekleyin
   - `google-services.json` (Android) ve `GoogleService-Info.plist` (iOS) dosyalarını güncelleyin

2. **App Store / Play Store**: 
   - Yeni bundle ID ile yeni bir uygulama olarak yayınlanacak
   - Eski uygulama farklı bir uygulama olarak kalacak

3. **Deep Links / Universal Links**:
   - Tüm deep link konfigürasyonlarını yeni bundle ID ile güncelleyin

4. **Third-party Services**:
   - Analytics, crash reporting vb. servislerde yeni bundle ID'yi kaydedin

## 📋 Checklist

- [x] pubspec.yaml güncellendi
- [x] Android package name değiştirildi
- [x] Android MainActivity taşındı
- [x] Android manifest güncellendi
- [x] iOS bundle identifier değiştirildi
- [x] iOS Info.plist güncellendi
- [ ] Firebase konfigürasyonu güncellendi (gerekirse)
- [ ] Clean build yapıldı
- [ ] Test edildi
