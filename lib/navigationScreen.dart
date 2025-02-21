import 'package:absensi_app/pages/dashboard.dart';
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
  int currentindex = 1;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationBar = GlobalKey();

  static const List<Widget> _pages = <Widget>[
    studentsPage(),
    homeScreen(),
    StudentattendancePage(),
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
          Icon(Icons.home, size: 20),
          Icon(Icons.access_time, size: 20),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 170, 170, 170),
        animationCurve: Curves.easeIn,
        animationDuration: Duration(milliseconds: 400),
        onTap: _onItemTapped);
  }
}
