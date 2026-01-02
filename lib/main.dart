import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharedprefernces/Provider/AuthProvider.dart';
import 'package:sharedprefernces/Provider/FunctionsProvider.dart';
import 'package:sharedprefernces/Screens/Login%20Using%20Provide%20&%20Shared%20Prefernces/SplashScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FunctionsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: SplashScreen(), // your screen
    );
  }
}
