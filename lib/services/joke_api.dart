import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jokeapi/model/joke_model.dart';

class JokeApi with ChangeNotifier {
  static const String baseUrl = "https://v2.jokeapi.dev";
  static const String endpoint = "/joke/Any";

  jokemodel? _joke;
  bool _isLoading = false;
  String _error = '';

  // Getters
  jokemodel? get joke => _joke;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> getJoke() async {
    try {
      _isLoading = true;
      _error = '';
      _joke = null; // Reset joke before fetching
      notifyListeners();

      final Uri url = Uri.parse('$baseUrl$endpoint');
      final response = await http.get(url).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Connection timeout');
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _joke = jokemodel.fromJson(data);
        debugPrint("\n\n ${joke!.setup}");
      } else if (response.statusCode == 404) {
        throw Exception('Joke not found');
      } else if (response.statusCode >= 500) {
        throw Exception('Server error');
      } else {
        throw Exception('Failed to load joke: ${response.statusCode}');
      }
    } on FormatException {
      _error = 'Invalid response format';
    } on http.ClientException {
      _error = 'Network error occurred';
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
