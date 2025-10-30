import 'package:colt_ecommerce_app/core/theme/app_colors.dart';
import 'package:colt_ecommerce_app/features/home/presentation/screens/home_screen.dart';
import 'package:colt_ecommerce_app/features/notification/presentation/screens/notification_screen.dart';
import 'package:colt_ecommerce_app/features/order/presentation/screens/order_screen.dart';
import 'package:colt_ecommerce_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    NotificationScreen(),
    OrderScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem _navItem(
    String iconPath,
    String label,
    bool isSelected,
    Color selectedColor,
    Color unselectedColor,
  ) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        width: 26.w,
        height: 26.h,
        colorFilter: ColorFilter.mode(
          isSelected ? selectedColor : unselectedColor,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          height: 85.h,
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow.withOpacity(0.06),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor: colorScheme.primary,
              unselectedItemColor: colorScheme.onSurfaceVariant,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              items: [
                _navItem(
                  "asset/icon/home2.svg",
                  "Home",
                  _selectedIndex == 0,
                  AppColors.primary,
                  colorScheme.onSurfaceVariant,
                ),
                _navItem(
                  "asset/icon/notificationbing.svg",
                  "Notifications",
                  _selectedIndex == 1,
                  AppColors.primary,
                  colorScheme.onSurfaceVariant,
                ),
                _navItem(
                  "asset/icon/order.svg",
                  "Orders",
                  _selectedIndex == 2,
                  AppColors.primary,
                  colorScheme.onSurfaceVariant,
                ),
                _navItem(
                  "asset/icon/profile.svg",
                  "Profile",
                  _selectedIndex == 3,
                  AppColors.primary,
                  colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
