import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/subscription_provider.dart';
import 'screens/home_screen.dart';

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
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
