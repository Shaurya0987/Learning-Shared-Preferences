import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharedprefernces/Provider/AuthProvider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthProvider>().logOut();
            },
          )
        ],
      ),
      body: const Center(
        child: Text("You are logged in 🎉"),
      ),
    );
  }
}
