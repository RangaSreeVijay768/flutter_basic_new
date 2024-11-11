import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = "https://gen8ai.in:8082/api";

  Future<Map<String, dynamic>?> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/auth/signin');
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        // Add any additional headers your API might require
        "User-Agent": "YourAppName",  // Replace with your app name
      },
      body: jsonEncode({"username": username, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['accessToken'] != null) {
        // Store user in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', jsonEncode(data));
      }
      return data;
    } else {
      // Log the response body to understand the error
      print('Login failed with status: ${response.statusCode}, body: ${response.body}');
      return null; // Handle error responses
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }

  Map<String, dynamic>? getCurrentUser() {
    return jsonDecode(SharedPreferences.getInstance().then((prefs) => prefs.getString('user') ?? 'null') as String);
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('user');
  }

  String? getLocalAccessToken() {
    final user = getCurrentUser();
    return user != null ? user['accessToken'] : null;
  }

  String? getLocalRefreshToken() {
    final user = getCurrentUser();
    return user != null ? user['refreshToken'] : null;
  }
}
