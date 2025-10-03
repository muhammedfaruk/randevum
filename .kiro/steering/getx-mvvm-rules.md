---
inclusion: always
---

# GetX MVVM Architecture Rules

Bu projede GetX state management ile MVVM pattern kullanılmaktadır. Aşağıdaki kuralları takip edin:

## 📁 Klasör Yapısı

```
lib/
├── core/
│   ├── config/
│   ├── routes/
│   └── di/
├── modules/
│   └── [module_name]/
│       ├── controllers/
│       ├── views/
│       ├── models/
│       └── services/
└── presentation/
    └── views/
        └── [page_name]/
            ├── [page_name]_view.dart
            └── [page_name]_controller.dart
```

## 🎯 Controller Kuralları

### GetxController Kullanımı (update() Yöntemi)

```dart
class ExampleController extends GetxController {
  // Normal değişkenler (Rx kullanmayın)
  String title = 'Initial Value';
  bool isLoading = false;
  List<Model> items = <Model>[];

  // Lifecycle methods
  @override
  void onInit() {
    super.onInit();
    // Initialization logic
  }

  @override
  void onReady() {
    super.onReady();
    // Called after widget is rendered
  }

  @override
  void onClose() {
    // Cleanup logic
    super.onClose();
  }

  // Business logic methods
  void updateTitle(String newTitle) {
    title = newTitle;
    update(); // UI'ı güncelle
  }

  Future<void> loadData() async {
    isLoading = true;
    update(); // Loading state'i göster

    try {
      // API call or data loading
      final data = await service.getData();
      items = data;
    } catch (e) {
      // Error handling
      Get.snackbar('Hata', 'Veri yüklenirken hata oluştu');
    } finally {
      isLoading = false;
      update(); // Final state'i güncelle
    }
  }

  // Belirli widget'ları güncellemek için ID kullanın
  void updateSpecificSection() {
    // Logic here
    update(['header']); // Sadece 'header' ID'li widget'ları güncelle
  }
}
```

## 🖼️ View Kuralları

### GetBuilder Kullanımı (Ana Yöntem)

```dart
class ExampleView extends GetView<ExampleController> {
  const ExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<ExampleController>(
          id: 'header', // Belirli bölüm için ID
          builder: (controller) => Text(controller.title),
        ),
      ),
      body: GetBuilder<ExampleController>(
        builder: (controller) {
          return controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.items[index].name),
                  );
                },
              );
        },
      ),
    );
  }
}
```

### Performans Optimizasyonu için ID Kullanımı

```dart
class ExampleView extends GetView<ExampleController> {
  const ExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Sadece header güncellensin
          GetBuilder<ExampleController>(
            id: 'header',
            builder: (controller) => Text(controller.title),
          ),

          // Sadece liste güncellensin
          GetBuilder<ExampleController>(
            id: 'list',
            builder: (controller) => Expanded(
              child: ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(controller.items[index].name),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

## 🔄 State Management Kuralları

### 1. Normal Variables (Rx KULLANMAYIN)

- Basit değerler için: `String`, `int`, `bool`
- Listeler için: `List<T>`
- Objeler için: `CustomClass`

### 2. Update() Yöntemi

- **update()**: Tüm GetBuilder widget'larını günceller
- **update(['id'])**: Sadece belirtilen ID'li widget'ları günceller

### 3. Update Patterns

```dart
// ✅ Doğru kullanım - Normal variables
String name = 'John';
List<String> items = [];

// ✅ Değer değiştirme ve güncelleme
void changeName(String newName) {
  name = newName;
  update(); // Tüm UI güncellenir
}

// ✅ Liste güncellemeleri
void addItem(String item) {
  items.add(item);
  update(['list']); // Sadece 'list' ID'li widget güncellenir
}

void removeItem(int index) {
  items.removeAt(index);
  update(['list']);
}

// ✅ Belirli bölümleri güncelleme
void updateHeader() {
  title = 'New Title';
  update(['header']); // Sadece header güncellenir
}

void updateCounter() {
  counter++;
  update(['counter']); // Sadece counter güncellenir
}
```

## 🏗️ Dependency Injection

### Binding Kullanımı

```dart
class ExampleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleController>(() => ExampleController());
    Get.lazyPut<ExampleService>(() => ExampleService());
  }
}
```

### Route Tanımları

```dart
GetPage(
  name: '/example',
  page: () => const ExampleView(),
  binding: ExampleBinding(),
),
```

## 🚫 Yapmayın

1. **StatefulWidget kullanmayın** - GetX update() system kullanın
2. **setState() kullanmayın** - update() kullanın
3. **Rx variables kullanmayın** - Normal variables + update() kullanın
4. **Obx() kullanmayın** - GetBuilder kullanın
5. **Controller'da UI logic yazmayın** - Sadece business logic
6. **View'da business logic yazmayın** - Controller'a taşıyın
7. **Gereksiz update() çağrıları yapmayın** - ID'li update kullanın

## ✅ Best Practices

1. **Controller isimlendirme**: `[PageName]Controller`
2. **View isimlendirme**: `[PageName]View`
3. **Normal variables**: Descriptive names kullanın
4. **Error handling**: Try-catch blocks ve user feedback
5. **Loading states**: UI feedback için loading indicators
6. **Memory management**: onClose() method'unda cleanup yapın
7. **Performance**: ID'li update() kullanarak sadece gerekli widget'ları güncelleyin
8. **Update strategy**: Her değişiklikten sonra update() çağırın

## 🔧 Debugging

```dart
// Debug için
void debugPrint() {
  print('Current state: $title');
  print('Items count: ${items.length}');
  print('Loading: $isLoading');
}

// Update tracking (development only)
@override
void update([List<Object>? ids, bool condition = true]) {
  print('Updating widgets: ${ids ?? 'all'}');
  super.update(ids, condition);
}

// Method tracking
void updateTitle(String newTitle) {
  print('Title changing from: $title to: $newTitle');
  title = newTitle;
  update(['header']);
}
```

## 📱 Navigation

```dart
// Sayfa geçişleri
Get.to(() => const NextPage());
Get.off(() => const ReplacePage());
Get.offAll(() => const HomePage());

// Named routes
Get.toNamed(AppRoutes.home);
Get.offNamed(AppRoutes.replacePage);
Get.offAllNamed(AppRoutes.root);

// Arguments
Get.toNamed(AppRoutes.home, arguments: {'id': 123});
```

Bu kuralları takip ederek tutarlı ve maintainable kod yazın.
