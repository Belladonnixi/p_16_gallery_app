import 'package:flutter/material.dart';
import 'package:p_16_gallery_app/presentation/screens/about_me_screen.dart';
import 'package:p_16_gallery_app/presentation/screens/gallery_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const GalleryScreen(),
    const AboutMeScreen(),
  ];

  Navigator _buildNavigator() {
    return Navigator(
      key: GlobalKey<NavigatorState>(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (context) => _screens[_selectedIndex],
        );
      },
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      iconSize: 28,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.photo_outlined),
          activeIcon: Icon(Icons.photo),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined),
          activeIcon: Icon(Icons.person),
          label: '',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildNavigator(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
