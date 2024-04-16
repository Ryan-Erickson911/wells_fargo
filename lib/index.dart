import 'package:flutter/material.dart';

import 'pages/home/home.dart';
import 'pages/home/map.dart';
import 'pages/home/docs.dart';


class MainNavigator extends StatefulWidget {
  final String navemail;
  final String navpassword;
  const MainNavigator({super.key, required this.navemail, required this.navpassword});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  late List<Widget> _screens;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    _screens = [
      HomePageWidget(email: widget.navemail, password: widget.navpassword),
      const PlaceTrackerApp(),
      DocsPage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green[100],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.read_more),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),  
    )
    );
  }
}