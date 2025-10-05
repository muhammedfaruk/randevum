import 'package:get/get.dart';

class StaffServicesController extends GetxController {
  // Çalışanlar
  List<Map<String, dynamic>> staff = <Map<String, dynamic>>[];
  List<Map<String, dynamic>> filteredStaff = <Map<String, dynamic>>[];
  
  // Hizmetler
  List<Map<String, dynamic>> services = <Map<String, dynamic>>[];
  List<Map<String, dynamic>> filteredServices = <Map<String, dynamic>>[];
  List<String> serviceCategories = <String>[];
  String selectedCategory = 'Tümü';

  @override
  void onInit() {
    super.onInit();
    _loadMockData();
  }

  void _loadMockData() {
    // Mock çalışan verileri
    staff = [
      {
        'id': 1,
        'name': 'Ahmet Yılmaz',
        'position': 'Kuaför',
        'rating': 4.8,
        'isAvailable': true,
        'specialties': ['Saç Kesimi', 'Sakal Tıraşı'],
      },
      {
        'id': 2,
        'name': 'Ayşe Demir',
        'position': 'Güzellik Uzmanı',
        'rating': 4.9,
        'isAvailable': false,
        'specialties': ['Makyaj', 'Cilt Bakımı'],
      },
      {
        'id': 3,
        'name': 'Mehmet Kaya',
        'position': 'Berber',
        'rating': 4.7,
        'isAvailable': true,
        'specialties': ['Saç Kesimi', 'Saç Boyama'],
      },
      {
        'id': 4,
        'name': 'Fatma Özkan',
        'position': 'Masöz',
        'rating': 4.6,
        'isAvailable': true,
        'specialties': ['Masaj', 'Aromaterapi'],
      },
    ];

    // Mock hizmet verileri
    services = [
      {
        'id': 1,
        'name': 'Erkek Saç Kesimi',
        'category': 'Saç',
        'description': 'Profesyonel erkek saç kesimi ve şekillendirme',
        'duration': 30,
        'price': 50,
      },
      {
        'id': 2,
        'name': 'Kadın Saç Kesimi',
        'category': 'Saç',
        'description': 'Kadın saç kesimi ve şekillendirme',
        'duration': 45,
        'price': 80,
      },
      {
        'id': 3,
        'name': 'Saç Boyama',
        'category': 'Saç',
        'description': 'Profesyonel saç boyama hizmeti',
        'duration': 120,
        'price': 150,
      },
      {
        'id': 4,
        'name': 'Sakal Tıraşı',
        'category': 'Saç',
        'description': 'Geleneksel ustura ile sakal tıraşı',
        'duration': 20,
        'price': 30,
      },
      {
        'id': 5,
        'name': 'Cilt Bakımı',
        'category': 'Cilt',
        'description': 'Derin temizlik ve nemlendirme',
        'duration': 60,
        'price': 120,
      },
      {
        'id': 6,
        'name': 'Makyaj',
        'category': 'Makyaj',
        'description': 'Özel gün makyajı',
        'duration': 45,
        'price': 100,
      },
      {
        'id': 7,
        'name': 'Relaks Masajı',
        'category': 'Masaj',
        'description': 'Tam vücut relaks masajı',
        'duration': 90,
        'price': 200,
      },
    ];

    // Kategorileri ayarla
    serviceCategories = ['Tümü', 'Saç', 'Cilt', 'Makyaj', 'Masaj'];
    
    // Filtrelenmiş listeleri başlat
    filteredStaff = staff;
    filteredServices = services;
  }



  void selectCategory(String category) {
    selectedCategory = category;
    
    if (category == 'Tümü') {
      filteredServices = services;
    } else {
      filteredServices = services.where((s) =>
        s['category'] == category
      ).toList();
    }
    update(['category-filters', 'services-list']);
  }

  void viewStaffDetails(Map<String, dynamic> staffMember) {
    Get.snackbar(
      'Çalışan Detayları',
      '${staffMember['name']} detay sayfası yakında eklenecek',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void addNewService() {
    Get.snackbar(
      'Yeni Hizmet',
      'Hizmet ekleme sayfası yakında eklenecek',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void addNewStaff() {
    Get.snackbar(
      'Yeni Çalışan',
      'Çalışan ekleme sayfası yakında eklenecek',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}