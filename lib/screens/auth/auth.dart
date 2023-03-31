import 'package:flutter/material.dart';
import './login.dart';
import './register.dart';
import '../../widgets/atoms/auth_title.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String _authScreen = 'login';

  void changeAuthScreen(String name) {
    setState(() {
      _authScreen = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: AuthTitle(title: _authScreen),
          ),
          Expanded(
            flex: 4,
            child: _authScreen == 'login' ? LoginScreen() : RegistreScreen(),
          ),
        ],
      ),
    );
  }
}
