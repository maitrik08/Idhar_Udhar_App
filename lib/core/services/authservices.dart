import 'dart:convert';
import 'package:http/http.dart' as http;

// --- AuthService ---
class AuthService {
  static const String _baseUrl = 'https://test-backend-faa4.onrender.com/api/auth';

  static Future<http.Response> signUp({
    required String name,
    required String email,
    required String dob,
    required String phone,
  }) async {
    final url = Uri.parse('$_baseUrl/signup');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'dob': dob,
          'number': phone, // ✅ backend expects 'number', not 'phone'
        }),
      );
      return response;
    } catch (e) {
      throw Exception("Signup failed: $e");
    }
  }
  static Future<http.Response> login({required String identifier}) async {
    final url = Uri.parse('$_baseUrl/login');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'identifier': identifier}),
      );
      return response;
    } catch (e) {
      throw Exception("Login failed: $e");
    }
  }



  static Future<http.Response> sendOTP({required String identifier}) async {
    final url = Uri.parse('$_baseUrl/send-otp');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'identifier': identifier}),
      );
      return response;
    } catch (e) {
      throw Exception("Send OTP failed: $e");
    }
  }

  static Future<http.Response> verifyOTP({
    required String otp,
    required String userId,
  }) async {
    final url = Uri.parse('$_baseUrl/verify-otp');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'otp': otp,
          'userId': userId,
        }),
      );
      return response;
    } catch (e) {
      throw Exception("OTP verification failed: $e");
    }
  }
}