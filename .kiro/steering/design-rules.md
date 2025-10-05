---
inclusion: always
---

# Design System Rules (Dark UI – “Mfs Berber” Görünümü)

Bu projede tutarlı ve modern bir design system kullanılmaktadır. Aşağıdaki kuralları takip edin:

---

## 🎨 Color Palette

### Primary Colors (Sky Blue)

```dart
AppColors.primary        // #80B0F8 - Ana vurgu (CTA, banner)
AppColors.primaryLight   // #A8C8F8 - Açık ton (hover, highlight)
AppColors.primaryDark    // #405880 - Koyu ton (outline, aktif durum)

```

### Background Colors (Slate Dark with Gradients)

```dart
AppColors.background     // #0f172a - Ana arkaplan (slate-900)
AppColors.backgroundAlt  // #1e293b - Alternatif arkaplan (slate-800)
AppColors.surface        // #1e293b %80 - Kart/yüzey
AppColors.surfaceAlt     // #0f172a %80 - Alternatif yüzey
AppColors.divider        // #334155 %50 - Ayraç çizgi (slate-700)

// Gradient Definitions
AppColors.backgroundGradient  // Ana arkaplan gradient
AppColors.cardGradient        // Kart arkaplan gradient
AppColors.timeSlotGradient    // Saat kutusu gradient (blue-purple)
```

### Text Colors

```dart
AppColors.textPrimary    // #F8F8F8 - Ana metin
AppColors.textSecondary  // #A0A7AF - İkincil metin
AppColors.textDisabled   // #6B737C - Devre dışı/placeholder
AppColors.link           // #80B0F8 - Linkler
```

### Status Colors

```dart
AppColors.success        // #22C55E - Başarı (yeşil)
AppColors.warning        // #F59E0B - Uyarı (turuncu)
AppColors.error          // #EF4444 - Hata (kırmızı)
AppColors.info           // #80B0F8 - Bilgi (primary ile hizalı)

// Status Badge Colors (Yeni - Badge'ler için kullanın)
AppColors.warningBg      // #F59E0B %20 - Bekliyor badge arka plan
AppColors.warningText    // #FBBF24 - Bekliyor badge text (amber-400)
AppColors.successBg      // #10B981 %20 - Tamamlandı badge arka plan
AppColors.successText    // #34D399 - Tamamlandı badge text (emerald-400)
```

## 📐 Spacing System

### Padding & Margin

```dart
// Küçük boşluklar
4.0, 6.0, 8.0

// Orta boşluklar
12.0, 16.0, 20.0

// Büyük boşluklar
24.0, 32.0, 40.0

// Ekstra büyük boşluklar
48.0, 64.0
```

### Border Radius (AppRadii Kullanın)

```dart
// AppRadii sınıfını import edin
import '../../../core/config/theme/app_radii.dart';

// Radius değerleri
AppRadii.sm   // 8.0  - Default (her zaman kullanın)
AppRadii.md   // 12.0 - Orta köşeler
AppRadii.lg   // 16.0 - Büyük köşeler
AppRadii.xl   // 24.0 - Ekstra büyük
AppRadii.x2l  // 32.0 - Çok büyük
AppRadii.x3l  // 48.0 - Maximum
AppRadii.full // 9999.0 - Tam yuvarlak

// Kullanım örnekleri
BorderRadius.circular(AppRadii.sm)   // Default - her zaman kullanın
BorderRadius.circular(AppRadii.md)   // Özel durumlar için
BorderRadius.circular(AppRadii.lg)   // Büyük kartlar için

// ❌ Yapmayın
BorderRadius.circular(12)  // Hardcoded değer
BorderRadius.circular(16)  // Hardcoded değer

// ✅ Yapın
BorderRadius.circular(AppRadii.sm)  // Default radius
```

## 🔤 Typography

### Font Sizes

```dart
// Küçük metinler
fontSize: 9   // Navigation labels
fontSize: 10  // Captions
fontSize: 12  // Small text

// Normal metinler
fontSize: 14  // Body text
fontSize: 15  // Button text
fontSize: 16  // Default body

// Başlıklar
fontSize: 18  // AppBar title
fontSize: 20  // Section headers
fontSize: 24  // Page titles
```

### Font Weights

```dart
FontWeight.w400  // Normal
FontWeight.w500  // Medium (buttons, labels)
FontWeight.w600  // Semi-bold (titles)
FontWeight.bold  // Bold (emphasis)
```

## 🎯 Component Rules

### Cards (Gradient Background)

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
)
```

### Time Slot / Special Cards (Blue-Purple Gradient)

```dart
Container(
  decoration: BoxDecoration(
    gradient: AppColors.timeSlotGradient,
    borderRadius: BorderRadius.circular(AppRadii.lg),
    boxShadow: [
      BoxShadow(
        color: Color(0x4D3b82f6), // blue-500 %30 opacity
        blurRadius: 16,
        spreadRadius: 0,
      ),
    ],
  ),
)
```

### Buttons

```dart
// Primary Button
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
)

// Secondary Button
OutlinedButton(
  style: OutlinedButton.styleFrom(
    foregroundColor: AppColors.primary,
    side: BorderSide(color: AppColors.primary, width: 1.5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
)
```

### Input Fields

```dart
TextField(
  decoration: InputDecoration(
    filled: true,
    fillColor: AppColors.surface,
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.gray200, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.primary, width: 1.5),
    ),
  ),
)
```

## 🎭 Animation Guidelines

### Duration Standards

```dart
Duration(milliseconds: 200)  // Hızlı animasyonlar (hover, tap)
Duration(milliseconds: 300)  // Standart animasyonlar (geçişler)
Duration(milliseconds: 500)  // Yavaş animasyonlar (sayfa geçişleri)
```

### Curve Standards

```dart
Curves.easeInOut    // Standart geçişler
Curves.easeOut      // Giriş animasyonları
Curves.easeIn       // Çıkış animasyonları
Curves.bounceOut    // Playful animasyonlar
```

## 📱 Layout Rules

### Container Sizing

```dart
// Minimum touch targets
minHeight: 48.0
minWidth: 48.0

// Navigation bar
height: 60.0

// AppBar
height: 56.0 (default)

// Card minimum height
minHeight: 80.0
```

### Icon Sizes

```dart
16.0  // Small icons (status, indicators)
18.0  // Navigation icons
20.0  // Default icons
24.0  // Large icons (headers)
32.0  // Extra large icons (empty states)
```

## 🚫 Don'ts

1. **Renk kullanımı**:

   - Hardcoded hex renkler kullanmayın
   - AppColors sınıfını kullanın

2. **Spacing**:

   - Rastgele padding/margin değerleri kullanmayın
   - Spacing system'e uyun

3. **Typography**:

   - Rastgele font boyutları kullanmayın
   - Belirlenen font scale'i takip edin

4. **Shadows**:
   - Çok koyu shadow'lar kullanmayın
   - opacity: 0.05-0.1 arasında tutun

## ✅ Best Practices

1. **Consistency**: Tüm sayfalarda aynı component stillerini kullanın
2. **Accessibility**: Minimum 48px touch target boyutu
3. **Performance**: Gereksiz animasyon kullanmayın
4. **Readability**: Yeterli contrast ratio sağlayın
5. **Responsive**: Farklı ekran boyutlarını düşünün

## 🎨 Status Colors Usage

```dart
// Randevu durumları (Badge kullanımı)
'Bekliyor'    → bg: AppColors.warningBg, text: AppColors.warningText
'Tamamlandı'  → bg: AppColors.successBg, text: AppColors.successText
'İptal'       → bg: AppColors.error.withOpacity(0.2), text: AppColors.error
'Onaylandı'   → bg: AppColors.info.withOpacity(0.2), text: AppColors.info

// Çalışan durumları
'Müsait'      → AppColors.success
'Meşgul'      → AppColors.error
'Molada'      → AppColors.warning
```

### Status Badge Component

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

## 📐 Component Specific Rules

### Scaffold with Gradient Background (Standart Pattern)

```dart
// Tüm sayfalarda bu pattern'i kullanın
Scaffold(
  backgroundColor: Colors.transparent,
  body: Container(
    decoration: const BoxDecoration(
      gradient: AppColors.backgroundGradient,
    ),
    child: SafeArea(
      child: Column(
        children: [
          // AppBar (custom)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  'Sayfa Başlığı',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          
          // Sayfa içeriği
          Expanded(
            child: YourContent(),
          ),
        ],
      ),
    ),
  ),
)
```

### Navigation Bar

```dart
height: 60.0
padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6)
shadow: BoxShadow(
  color: Colors.black.withOpacity(0.08),
  blurRadius: 15,
  offset: Offset(0, -3),
)
```

### List Items

```dart
padding: EdgeInsets.all(16)
margin: EdgeInsets.only(bottom: 12)
borderRadius: BorderRadius.circular(16)
```

### Form Elements

```dart
padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14)
borderRadius: BorderRadius.circular(12)
borderWidth: 1.5
```

Bu design system kurallarını takip ederek tutarlı ve profesyonel bir UI oluşturun.
