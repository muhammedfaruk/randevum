import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'staff_services_controller.dart';

class StaffServicesView extends GetView<StaffServicesController> {
  const StaffServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Çalışanlar & Hizmetler'),
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).textTheme.titleLarge?.color,
          bottom: TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(
                icon: Icon(Icons.people),
                text: 'Çalışanlar',
              ),
              Tab(
                icon: Icon(Icons.design_services),
                text: 'Hizmetler',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildStaffTab(context),
            _buildServicesTab(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStaffTab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Arama çubuğu
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Çalışan ara...',
                prefixIcon: const Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(16),
              ),
              onChanged: controller.searchStaff,
            ),
          ),
          const SizedBox(height: 16),
          
          // Çalışanlar listesi
          Expanded(
            child: GetBuilder<StaffServicesController>(
              id: 'staff-list',
              builder: (controller) => ListView.builder(
                itemCount: controller.filteredStaff.length,
                itemBuilder: (context, index) {
                  final staff = controller.filteredStaff[index];
                  return _buildStaffCard(context, staff);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesTab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Kategori filtreleri
          SizedBox(
            height: 50,
            child: GetBuilder<StaffServicesController>(
              id: 'category-filters',
              builder: (controller) => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.serviceCategories.length,
                itemBuilder: (context, index) {
                  final category = controller.serviceCategories[index];
                  final isSelected = controller.selectedCategory == category;
                  
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(category),
                      selected: isSelected,
                      onSelected: (selected) => controller.selectCategory(category),
                      selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
                      checkmarkColor: Theme.of(context).primaryColor,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          // Hizmetler listesi
          Expanded(
            child: GetBuilder<StaffServicesController>(
              id: 'services-list',
              builder: (controller) => ListView.builder(
                itemCount: controller.filteredServices.length,
                itemBuilder: (context, index) {
                  final service = controller.filteredServices[index];
                  return _buildServiceCard(context, service);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStaffCard(BuildContext context, Map<String, dynamic> staff) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  staff['name'][0].toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            
            // Bilgiler
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    staff['name'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    staff['position'],
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        staff['rating'].toString(),
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: staff['isAvailable'] ? Colors.green : Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        staff['isAvailable'] ? 'Müsait' : 'Meşgul',
                        style: TextStyle(
                          color: staff['isAvailable'] ? Colors.green : Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Aksiyon butonu
            IconButton(
              onPressed: () => controller.viewStaffDetails(staff),
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, Map<String, dynamic> service) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Hizmet ikonu
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _getServiceIcon(service['category']),
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            
            // Hizmet bilgileri
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    service['description'],
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${service['duration']} dk',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        '₺${service['price']}',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getServiceIcon(String category) {
    switch (category) {
      case 'Saç':
        return Icons.content_cut;
      case 'Cilt':
        return Icons.face;
      case 'Makyaj':
        return Icons.brush;
      case 'Masaj':
        return Icons.spa;
      default:
        return Icons.design_services;
    }
  }
}