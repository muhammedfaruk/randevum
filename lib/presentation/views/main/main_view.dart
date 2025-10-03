import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main_controller.dart';
import '../calendar/calendar_view.dart';
import '../staff_services/staff_services_view.dart';

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
              color: Colors.black.withOpacity(0.08),
              blurRadius: 15,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: SafeArea(
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  context,
                  icon: Icons.calendar_today_rounded,
                  label: 'Takvim',
                  index: 0,
                  isSelected: controller.currentIndex == 0,
                ),
                _buildNavItem(
                  context,
                  icon: Icons.people_rounded,
                  label: 'Çalışanlar',
                  index: 1,
                  isSelected: controller.currentIndex == 1,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required int index,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => controller.changeTab(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected 
            ? Theme.of(context).primaryColor.withOpacity(0.1)
            : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isSelected 
                  ? Theme.of(context).primaryColor
                  : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: isSelected 
                  ? Colors.white
                  : Theme.of(context).iconTheme.color?.withOpacity(0.6),
                size: 18,
              ),
            ),
            const SizedBox(height: 1),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                fontSize: 9,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected 
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.6),
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}