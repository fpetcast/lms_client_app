import 'dart:convert';
import '../config/config.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String? _accessToken;

  bool get isAuthenticated => _accessToken != null;

  Future<String> getAccessToken() async {
    if (_accessToken != null) {
      return _accessToken!;
    }

    throw Exception('Not authenticated');
  }

  Future<String> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('${Config.apiUrl}/authenticate'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to authenticate user');
    }

    final body = jsonDecode(response.body);
    final accessToken = body['access_token'];

    _accessToken = accessToken;

    return accessToken;
  }

  Future<void> register(String email, String password) async {
    final response = await http.post(
      Uri.parse('${Config.apiUrl}/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to register user');
    }
  }
}
