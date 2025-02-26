import 'package:absensi_app/pages/classesscreen.dart';
import 'package:absensi_app/pages/dashboard.dart';
import 'package:absensi_app/pages/settingscreen.dart';
import 'package:absensi_app/pages/studentattendance.dart';
import 'package:absensi_app/pages/studentsScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentindex = 2;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationBar = GlobalKey();

  static const List<Widget> _pages = <Widget>[
    studentsPage(),
    ClassesPage(),
    homeScreen(),
    StudentattendancePage(),
    SettingPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentindex],
      bottomNavigationBar: navbar(),
    );
  }

  Widget navbar() {
    return CurvedNavigationBar(
        height: 50,
        key: _bottomNavigationBar,
        index: currentindex,
        items: [
          Icon(Icons.person_add_alt_outlined, size: 20),
          Icon(Icons.class_, size: 20),
          Icon(Icons.access_time, size: 20),
          Icon(Icons.home, size: 20),
          Icon(Icons.settings, size: 20),
        ],
        color: const Color.fromARGB(255, 233, 231, 231),
        buttonBackgroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 254, 247, 255),
        animationCurve: Curves.easeIn,
        animationDuration: Duration(milliseconds: 400),
        onTap: _onItemTapped);
  }
}
