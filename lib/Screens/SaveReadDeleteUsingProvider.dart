import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharedprefernces/Provider/FunctionsProvider.dart';

class ProviderUsage extends StatefulWidget {
  const ProviderUsage({super.key});

  @override
  State<ProviderUsage> createState() => _ProviderUsageState();
}

class _ProviderUsageState extends State<ProviderUsage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController rollNoController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    rollNoController.dispose();
    super.dispose();
  }

  void clearControllers() {
    nameController.clear();
    ageController.clear();
    rollNoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FunctionsProvider>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Functions Using Provider"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Age",
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: rollNoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Roll No",
              ),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    context.read<FunctionsProvider>().readData();
                  },
                  child: const Text("Read"),
                ),
                TextButton(
                  onPressed: () {
                    context.read<FunctionsProvider>().saveData(
                          nameController.text.trim(),
                          ageController.text.trim(),
                          rollNoController.text.trim(),
                        );
                    clearControllers();
                  },
                  child: const Text("Save"),
                ),
                TextButton(
                  onPressed: () {
                    context.read<FunctionsProvider>().clearData();
                  },
                  child: const Text("Clear"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Text("Name : ${provider.name}"),
            Text("Age : ${provider.age}"),
            Text("RollNo : ${provider.rollNo}"),
          ],
        ),
      ),
    );
  }
}
