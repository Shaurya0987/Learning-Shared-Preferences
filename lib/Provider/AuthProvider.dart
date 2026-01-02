import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier{
  bool isLoggedIn=false;

  // Load login State
  Future<void>loadLoginState() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn=prefs.getBool("isLoggedIn")??false;
    notifyListeners();
  }

  // Login
  Future<void>login()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", true);
    isLoggedIn=true;
    notifyListeners();
  }

  // Log Out
  Future<void>logOut()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", false);
    isLoggedIn=false;
    notifyListeners();
  }
}