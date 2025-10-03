# 📱 Randevum - İş Yeri Randevu Yönetimi

## 🎯 Uygulama Amacı

İş yeri sahiplerinin günlük randevularını takip etmesini sağlayan mobil uygulama.

## ✨ Özellikler

### 1. Giriş Sistemi
- ✅ E-posta ve şifre ile giriş
- ✅ Otomatik oturum kontrolü
- ✅ Güvenli çıkış
- ✅ Mock data ile test (herhangi bir e-posta/şifre ile giriş yapılabilir)

### 2. Ana Ekran (Randevu Takvimi)
- ✅ Kullanıcı bilgileri gösterimi
- ✅ Tarih seçici (önceki/sonraki gün, takvim)
- ✅ Günlük istatistikler (Toplam, Onaylı, Bekleyen)
- ✅ Randevu listesi
- ✅ Randevu detayları (müşteri adı, telefon, saat, notlar)
- ✅ Durum göstergeleri (Onaylı/Bekliyor/İptal)

## 📱 Ekranlar

### 1. Splash Screen
- Uygulama logosu
- Otomatik oturum kontrolü
- Login/Home yönlendirmesi

### 2. Login Screen
- E-posta input
- Şifre input (göster/gizle)
- Giriş butonu
- Loading state
- Hata mesajları
- Demo bilgisi

### 3. Home Screen (Randevu Takvimi)
- Kullanıcı karşılama kartı
- Tarih navigasyonu
- İstatistik kartları
- Randevu listesi
- Çıkış butonu

## 🎨 Tasarım

### Renk Paleti (Matrix/Cyberpunk)
```dart
Primary: #10B981 (Emerald)
Secondary: #22C55E (Green)
Accent: #84CC16 (Lime)
Background: #000000 (Black)
```

### Durum Renkleri
- Onaylı: Yeşil (#22C55E)
- Bekliyor: Lime (#84CC16)
- İptal: Gri (#9CA3AF)

## 🏗️ Mimari

### GetX + MVVM Pattern
```
View ⇄ Controller ⇄ Service ⇄ API/Mock
```

### Modüller
```
lib/
├── core/                    # Temel yapı
│   ├── api/                # HTTP client
│   ├── config/theme/       # Tasarım sistemi
│   ├── di/                 # Dependency injection
│   ├── routes/             # Navigasyon
│   └── network/            # Bağlantı kontrolü
├── modules/
│   ├── auth/              # Giriş modülü
│   │   ├── models/
│   │   ├── auth_service.dart
│   │   ├── auth_controller.dart
│   │   └── views/login_screen.dart
│   ├── appointment/       # Randevu modülü
│   │   ├── models/
│   │   ├── appointment_service.dart
│   │   └── appointment_controller.dart
│   └── home/              # Ana ekran modülü
│       ├── home_controller.dart
│       └── views/home_screen.dart
└── presentation/          # Paylaşılan ekranlar
    └── views/splash/
```

## 📊 Mock Data

### Auth Service
```dart
useMockData = true

// Herhangi bir e-posta ve şifre (min 6 karakter) ile giriş yapılabilir
Email: test@example.com
Password: 123456

Mock User:
- ID: 1
- Name: Ahmet Yılmaz
- Role: owner
- Branch ID: 1
```

### Appointment Service
```dart
useMockData = true

// Bugün için 6 randevu
// Diğer günler için 2 randevu
// Farklı durumlar: confirmed, pending
```

## 🚀 Kurulum ve Çalıştırma

### 1. Dependencies
```bash
flutter pub get
```

### 2. Code Generation
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. Run
```bash
flutter run
```

## 🧪 Test Senaryoları

### Login
1. Uygulamayı aç
2. Herhangi bir e-posta gir (örn: test@test.com)
3. En az 6 karakterli şifre gir (örn: 123456)
4. "Giriş Yap" butonuna tıkla
5. ✅ Ana ekrana yönlendirileceksin

### Randevu Görüntüleme
1. Ana ekranda bugünün randevularını gör
2. Sol/sağ ok ile önceki/sonraki güne geç
3. Takvim ikonuna tıklayarak tarih seç
4. ✅ Seçilen günün randevularını gör

### Çıkış
1. Sağ üstteki çıkış ikonuna tıkla
2. ✅ Login ekranına yönlendirileceksin

## 📝 Geliştirme Notları

### Mock Data Kontrolü
Her service'de `useMockData` flag'i var:
```dart
final bool useMockData = true; // Development
final bool useMockData = false; // Production
```

### Production'a Geçiş
1. Her service'de `useMockData = false` yap
2. `.env` dosyasında API URL'i güncelle
3. Backend API'yi hazırla

### Yeni Özellik Ekleme
1. Model oluştur (`models/`)
2. Service oluştur (API + mock data)
3. Controller oluştur (GetX)
4. View oluştur (UI)
5. Route ekle (`app_routes.dart`, `app_pages.dart`)

## 🎯 Gelecek Özellikler

### Kısa Vadeli
- [ ] Randevu detay ekranı
- [ ] Randevu durumu güncelleme
- [ ] Filtreleme (durum, saat)
- [ ] Arama (müşteri adı, telefon)

### Orta Vadeli
- [ ] Haftalık görünüm
- [ ] Aylık görünüm
- [ ] İstatistikler sayfası
- [ ] Bildirimler

### Uzun Vadeli
- [ ] Randevu oluşturma
- [ ] Müşteri yönetimi
- [ ] Personel yönetimi
- [ ] Raporlama

## 📞 Destek

Sorular için dokümantasyona bakın:
- `PROJECT_SUMMARY.md` - Proje özeti
- `MOCK_DATA_GUIDE.md` - Mock data kullanımı
- `.kiro/steering/project-rules.md` - Geliştirme kuralları

---

**Durum:** ✅ MVP Ready
**Son Güncelleme:** 3 Ekim 2025
