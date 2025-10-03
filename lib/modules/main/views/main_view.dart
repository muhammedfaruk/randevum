import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/main_controller.dart';
import '../../calendar/views/calendar_view.dart';
import '../../staff_services/views/staff_services_view.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainController>(
        builder: (controller) => IndexedStack(
          index: controller.currentIndex,
          children: const [
            CalendarView(),
            StaffServicesView(),
          ],
        ),
      ),
      bottomNavigationBar: GetBuilder<MainController>(
        builder: (controller) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 15,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: SafeArea(
            child: Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.changeTab(0),
                      behavior: HitTestBehavior.opaque,
                      child: _buildNavItem(
                        context,
                        icon: Icons.calendar_today_rounded,
                        label: 'Takvim',
                        index: 0,
                        isSelected: controller.currentIndex == 0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.changeTab(1),
                      behavior: HitTestBehavior.opaque,
                      child: _buildNavItem(
                        context,
                        icon: Icons.settings_rounded,
                        label: 'Yönet',
                        index: 1,
                        isSelected: controller.currentIndex == 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required int index,
    required bool isSelected,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).iconTheme.color?.withValues(alpha: 0.6),
            size: 18,
          ),
          const SizedBox(height: 1),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              fontSize: 9,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
            ),
            child: Text(label),
          ),
        ],
      ),
    );
  }
}