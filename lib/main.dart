import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/subscription_provider.dart';
import 'screens/home_screen.dart';
import 'screens/calendar_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SubscriptionProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: BottomNavBarScreen(),
      ),
    );
  }
}

class BottomNavBarScreen extends StatefulWidget {
  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0; // Index of selected tab

  // List of screens for navigation
  final List<Widget> _screens = [
    HomeScreen(),
    CalendarScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Expanded(
              child: _screens[_selectedIndex], // Show the selected screen
            ),
            BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index; // Change tab index
                });
              },

              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white), // Home icon
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today,
                      color: Colors.white), // Calendar icon
                  label: 'Calendar',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings,
                      color: Colors.white), // Settings icon
                  label: 'Settings',
                ),
              ],
              enableFeedback: true,
              backgroundColor: Colors.black, // Background color for the bar
              selectedItemColor: Colors.cyan.shade50, // Highlighted color
              unselectedItemColor: Colors.white54, // Color for unselected items
            ),
          ],
        ),
      ),
    );
  }
}
