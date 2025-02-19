import 'package:flutter/material.dart';

class Allprovider with ChangeNotifier {
  bool _isVisible = true;
  bool get isVisible => _isVisible;
  toggle() {
    _isVisible = !_isVisible;
    notifyListeners();
  }
}
