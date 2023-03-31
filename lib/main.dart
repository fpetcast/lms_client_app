import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/auth/auth.dart';
import './services/auth_service.dart';

void main() {
  // This line ensures that Flutter initializes properly
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: authService.isAuthenticated ? HomeScreen() : AuthScreen(),
    );
  }
}
