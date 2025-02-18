import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jokeapi/model/joke_model.dart';

class JokeApi with ChangeNotifier {
  static const String baseUrl = "https://v2.jokeapi.dev";
  static const String endpoint = "/joke/Any";
  jokemodel? _joke;
  jokemodel? get joke => _joke;
  bool? _isloading = false;
  bool? get isloading => _isloading;
  void steFlage(String flag) async {
    _isloading = true;
    notifyListeners();
    try {
      var response = await http
          .get(Uri.parse(baseUrl + endpoint + "?blacklistFlags" + flag));
      final objectdata = jsonDecode(response.body);
      debugPrint("\n\n  ${response.body}  \n\n");

      if (response.statusCode == 200) {
        _joke = jokemodel.fromJson(objectdata);
        notifyListeners();
      }
    } catch (e) {
      debugPrint("\n\n $e \n\n");
    }
    _isloading = false;
    notifyListeners();
  }

  Future<dynamic> fetxh() async {
    _isloading = true;
    notifyListeners();
    try {
      var response = await http.get(Uri.parse(baseUrl + endpoint));
      final objectdata = jsonDecode(response.body);
      debugPrint("\n\n  ${response.body}  \n\n");

      if (response.statusCode == 200) {
        _joke = jokemodel.fromJson(objectdata);
        notifyListeners();
      }
    } catch (e) {
      debugPrint("\n\n $e \n\n");
    }
    _isloading = false;
    notifyListeners();
  }
}
