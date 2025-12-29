import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  // SAVE DATA
  Future<void> saveName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', 'Shaurya');
  }

  // READ DATA
  Future<void> readName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('name');
    debugPrint(name); // shows in console
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SharedPreferences Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: saveName,
              child: const Text("SAVE NAME"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: readName,
              child: const Text("READ NAME"),
            ),
          ],
        ),
      ),
    );
  }
}