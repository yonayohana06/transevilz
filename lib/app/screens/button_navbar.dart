import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:transevilz/home/home.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _currentIndex = 0;

  final List<Widget> _mainMenu = [
    const HomeScreen(),
    const Center(child: Text("Layanan")),
    const Center(child: Text("Riwayat")),
    const Center(child: Text("Akun")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainMenu[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        selectedLabelStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        unselectedItemColor: Colors.blueGrey[200],
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.home, size: 20),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.messageCircle, size: 20),
            label: 'Layanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.fileText, size: 20),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.user, size: 20),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
