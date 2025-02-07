import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
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
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.1))
              ]),
              padding: EdgeInsets.all(12),
              child: GNav(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                gap: 10,
                curve: Curves.easeInCubic,
                tabBackgroundColor: Colors.cyan.shade50,
                rippleColor: Colors.cyan.shade50,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                tabs: [
                  GButton(text: "Home", icon: LineIcons.home),
                  GButton(text: "Calendar", icon: LineIcons.calendar),
                  GButton(text: "Settings", icon: LineIcons.cog)
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index; // Change tab index
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
