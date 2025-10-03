# 🎭 Mock Data Kullanım Kılavuzu

## 📋 Genel Bakış

Backend servisleri hazır olmadığı için tüm servisler mock data ile çalışacak şekilde yapılandırıldı. Bu sayede backend bağımsız olarak UI/UX geliştirmesi yapılabilir.

## 🎯 Avantajlar

- ✅ Backend bağımsız geliştirme
- ✅ Hızlı prototipleme
- ✅ UI/UX testleri
- ✅ Demo sunumları
- ✅ Kolay production geçişi

## 🔧 Kullanım

### Service Flag Kontrolü

Her service'de `useMockData` flag'i var:

```dart
class BranchService {
  final bool useMockData = true; // Production'da false yap
  
  Future<BranchModel> getBySlug(String slug) async {
    if (useMockData) {
      await Future.delayed(const Duration(seconds: 1));
      return _getMockBranch(slug);
    }
    // Real API call...
  }
}
```

### Production'a Geçiş

Sadece flag'i değiştir:

```dart
final bool useMockData = false; // ✅ Production ready!
```

## 📦 Mevcut Mock Data

### 1. Branch Service

**Mock Branch Data:**
```dart
BranchModel(
  id: 1,
  name: 'Randevum Demo Şube',
  slug: slug,
  description: 'Modern randevu yönetim sistemi...',
  address: 'Maslak Mahallesi, Büyükdere Caddesi No:255, Sarıyer/İstanbul',
  phone: '+90 555 123 4567',
  email: 'info@randevum.com',
  primaryColor: '#10B981',
  secondaryColor: '#22C55E',
  isActive: true,
)
```

**Delay:** 1 saniye

### 2. Appointment Service

#### Create Guest Appointment
**Mock Response:**
```dart
AppointmentModel(
  id: 1001,
  branchId: 1,
  serviceId: 1,
  staffId: 1,
  guestFirstName: 'Ahmet',
  guestLastName: 'Yılmaz',
  guestEmail: 'ahmet@example.com',
  guestPhone: '+90 555 123 4567',
  status: 'confirmed',
  confirmationCode: 'RDV1234567',
  startTime: '2025-10-04T10:00:00',
  endTime: '2025-10-04T10:30:00',
)
```

**Delay:** 1.5 saniye

#### Get Time Slots
**Mock Response:**
- 09:00 - 18:00 arası 30 dakikalık slotlar
- Bazı slotlar dolu (10:00, 14:30, 16:00)
- Gerçekçi availability durumu

**Delay:** 800ms

#### Track Appointment
**Mock Response:**
```dart
AppointmentModel(
  id: 1001,
  status: 'confirmed',
  confirmationCode: code,
  startTime: 'Yarın 10:00',
  endTime: 'Yarın 10:30',
  notes: 'Lütfen zamanında gelin',
)
```

**Delay:** 1 saniye

## 🎨 Mock Data Özellikleri

### Network Delay Simülasyonu
```dart
await Future.delayed(const Duration(seconds: 1));
```

Gerçekçi network gecikmesi simüle edilir:
- Hızlı işlemler: 500-800ms
- Normal işlemler: 1s
- Yavaş işlemler: 1.5-2s

### Gerçekçi Veriler
- Türkçe içerik
- Geçerli telefon formatları
- İstanbul adresleri
- Gerçekçi zaman dilimleri

### Hata Durumları
Mock data'da hata simülasyonu için:

```dart
if (slug == 'error-test') {
  throw ServerException('Mock error for testing');
}
```

## 📝 Yeni Mock Data Ekleme

### 1. Service'e Flag Ekle
```dart
class YourService {
  final bool useMockData = true;
  
  Future<YourModel> getData() async {
    if (useMockData) {
      await Future.delayed(const Duration(milliseconds: 800));
      return _getMockData();
    }
    // Real API...
  }
}
```

### 2. Mock Method Oluştur
```dart
YourModel _getMockData() {
  return YourModel(
    id: 1,
    name: 'Mock Data',
    // ... diğer alanlar
  );
}
```

### 3. Liste İçin Mock
```dart
List<YourModel> _getMockList() {
  return [
    YourModel(id: 1, name: 'Item 1'),
    YourModel(id: 2, name: 'Item 2'),
    YourModel(id: 3, name: 'Item 3'),
  ];
}
```

## 🧪 Test Senaryoları

### Başarılı Senaryo
```dart
final branch = await branchService.getBySlug('demo-branch');
// ✅ Mock data döner
```

### Loading State
```dart
// 1 saniye loading gösterilir
// Sonra data gelir
```

### Error Handling
```dart
try {
  final branch = await branchService.getBySlug('error-test');
} catch (e) {
  // ❌ Mock error yakalanır
}
```

## 🚀 Production Checklist

Production'a geçmeden önce:

- [ ] Tüm servislerde `useMockData = false` yap
- [ ] API base URL'i production'a çevir (.env)
- [ ] Mock metodları kaldırma (gelecekte lazım olabilir)
- [ ] Network error handling test et
- [ ] Timeout değerlerini kontrol et
- [ ] API response formatlarını doğrula

## 💡 İpuçları

### Development
```dart
final bool useMockData = true; // Hızlı geliştirme
```

### Staging
```dart
final bool useMockData = false; // Backend test
```

### Production
```dart
final bool useMockData = false; // Canlı sistem
```

### Environment-Based
```dart
final bool useMockData = const String.fromEnvironment('USE_MOCK_DATA') == 'true';
```

## 📊 Mock Data Durumu

| Service | Mock Data | Delay | Status |
|---------|-----------|-------|--------|
| BranchService | ✅ | 1s | Ready |
| AppointmentService | ✅ | 0.8-1.5s | Ready |
| ServiceService | ⏳ | - | TODO |
| StaffService | ⏳ | - | TODO |
| AuthService | ⏳ | - | TODO |

## 🔗 İlgili Dosyalar

- `lib/modules/branch/branch_service.dart`
- `lib/modules/appointment/appointment_service.dart`
- `.kiro/steering/project-rules.md` (Bölüm 12)

---

**Not:** Mock data sadece development aşamasında kullanılır. Production'da mutlaka gerçek API'ye geçilmelidir.
