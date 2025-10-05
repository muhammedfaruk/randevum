---
inclusion: manual
---

# Gradient Migration Summary

## 🎨 Yeni Renk Şeması

Proje artık modern gradient tabanlı dark UI kullanıyor.

### Ana Değişiklikler

#### 1. Background Colors (Slate Dark)
- `AppColors.background` → #0f172a (slate-900)
- `AppColors.backgroundAlt` → #1e293b (slate-800)
- `AppColors.surface` → #1e293b %80 opacity
- `AppColors.divider` → #334155 %50 opacity (slate-700)

#### 2. Gradient Definitions
```dart
// Ana arkaplan gradient
AppColors.backgroundGradient

// Kart arkaplan gradient
AppColors.cardGradient

// Özel saat kutusu gradient (blue-purple)
AppColors.timeSlotGradient
```

#### 3. Status Badge Colors
```dart
// Bekliyor
AppColors.warningBg   // #F59E0B %20 opacity
AppColors.warningText // #FBBF24 (amber-400)

// Tamamlandı
AppColors.successBg   // #10B981 %20 opacity
AppColors.successText // #34D399 (emerald-400)
```

## 📝 Güncellenen Dosyalar

### Core Files
- ✅ `lib/core/config/theme/app_colors.dart` - Yeni renkler ve gradientler eklendi
- ✅ `lib/core/config/theme/app_theme.dart` - Gradient desteği eklendi
- ✅ `.kiro/steering/design-rules.md` - Yeni design system kuralları

### View Files
- ✅ `lib/modules/calendar/views/calendar_view.dart` - Gradient arka plan ve badge'ler
- ✅ `lib/modules/staff_services/views/staff_services_view.dart` - Gradient arka plan
- ✅ `lib/modules/home/views/home_screen.dart` - Gradient arka plan ve badge'ler

## 🎯 Standart Scaffold Pattern

Tüm yeni sayfalarda bu pattern kullanılmalı:

```dart
Scaffold(
  backgroundColor: Colors.transparent,
  body: Container(
    decoration: const BoxDecoration(
      gradient: AppColors.backgroundGradient,
    ),
    child: SafeArea(
      child: YourContent(),
    ),
  ),
)
```

## 🎨 Standart Card Pattern

```dart
Container(
  decoration: BoxDecoration(
    gradient: AppColors.cardGradient,
    borderRadius: BorderRadius.circular(AppRadii.lg),
    border: Border.all(
      color: AppColors.divider,
      width: 1,
    ),
  ),
  child: YourContent(),
)
```

## 🏷️ Standart Badge Pattern

```dart
Container(
  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  decoration: BoxDecoration(
    color: status == 'Bekliyor' ? AppColors.warningBg : AppColors.successBg,
    borderRadius: BorderRadius.circular(AppRadii.sm),
  ),
  child: Text(
    status,
    style: TextStyle(
      color: status == 'Bekliyor' ? AppColors.warningText : AppColors.successText,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  ),
)
```

## ⚠️ Önemli Notlar

1. **Scaffold backgroundColor**: Her zaman `Colors.transparent` kullanın
2. **Card color**: `Theme.of(context).cardColor` yerine gradient kullanın
3. **Status badges**: Yeni badge color system kullanın
4. **Border colors**: `AppColors.divider` kullanın
5. **Border radius**: `AppRadii.lg` (16) kartlar için standart

## 🚀 Sonraki Adımlar

Diğer view dosyaları da aynı pattern ile güncellenebilir:
- Auth views
- Branch views
- Splash view
- Diğer custom view'lar
