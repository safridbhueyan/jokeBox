import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Fya with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth get auth => _auth;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  //sign in
  Future<void> register(String email, String pass) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      notifyListeners();
    } on FirebaseAuthException catch (error) {
      debugPrint("\n\n $error \n\n ");
    } catch (error) {
      debugPrint("\n\n $error \n\n ");
    }
    _isLoading = false;
    notifyListeners();
  }

  //login
  Future<void> login(String email, String pass) async {
    _isLoading = true;
    notifyListeners();
    try {
      var cred = _auth.signInWithEmailAndPassword(email: email, password: pass);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      debugPrint("\n\n $e \n\n");
    } catch (e) {
      debugPrint("\n\n $e \n\n");
    }
    _isLoading = false;
    notifyListeners();
  }

  //logout
  Future<void> logout() async {
    try {
      await _auth.signOut();
      notifyListeners();
    } catch (e) {
      debugPrint("\n\n $e \n\n");
    }
  }
}
