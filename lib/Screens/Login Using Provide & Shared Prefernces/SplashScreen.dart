import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharedprefernces/Provider/AuthProvider.dart';
import 'package:sharedprefernces/Screens/Login%20Using%20Provide%20&%20Shared%20Prefernces/HomeScreen.dart';
import 'package:sharedprefernces/Screens/Login%20Using%20Provide%20&%20Shared%20Prefernces/LoginScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth=context.watch<AuthProvider>();
    if(auth.isLoggedIn){
      return HomeScreen();
    }
    else{
      return LoginScreen();
    }
  }
}