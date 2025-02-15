import '../../../../core/Routing/routes.dart';
import '../views/main_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../notification/presentation/views/notification_screen.dart';
import '../../../profile/views/profile_view_default.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({super.key});

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int _selectedIndex = 0;

  // ignore: unused_field
  static final List<Widget> _widgetOptions = <Widget>[
    MainScreen(),
    // WishlistScreen(),
    NotificationScreen(),
    ProfileScreenDefault(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 3) {
      Navigator.pushNamed(context, Routes.profile).then(
        (value) {
          setState(() {
            _selectedIndex = 0;
          });
        },
      );
    } else if (index == 2) {
      Navigator.pushNamed(context, Routes.notification).then(
        (value) {
          setState(() {
            _selectedIndex = 0;
          });
        },
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 163, 26, 26),
        selectedItemColor: AppColors.myBlue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Wishlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ]);
  }
}
