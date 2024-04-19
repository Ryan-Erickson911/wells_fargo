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
      const MapPage(),
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
    return SafeArea(
      child: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: Material(
          elevation: 20, // Set the elevation value here
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Map',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt),
                label: 'Docs',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}