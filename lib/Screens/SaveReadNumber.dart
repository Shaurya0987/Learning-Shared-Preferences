import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveReadNumber extends StatefulWidget {
  const SaveReadNumber({super.key});

  @override
  State<SaveReadNumber> createState() => _SaveReadNumberState();
}

class _SaveReadNumberState extends State<SaveReadNumber> {
  TextEditingController nameController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
  TextEditingController ageController = TextEditingController();


  @override
  void dispose() {
  nameController.dispose();
  ageController.dispose();
  rollNoController.dispose();
  super.dispose();
}


  String savedName = "";
  String savedAge = "";
  String savedRollNo = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("name"),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: rollNoController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("roll no"),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: ageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("age"),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    setState(() {
                      savedName = prefs.getString("name") ?? "";
                      savedAge = prefs.getString("age") ?? "";
                      savedRollNo = prefs.getString("rollNo") ?? "";
                    });
                  },

                  child: const Text(
                    "Read",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    await prefs.setString("name", nameController.text.trim());
                    await prefs.setString("age", ageController.text.trim());
                    await prefs.setString("rollNo",rollNoController.text.trim(),
                    );
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text("Data Saved")));
                  },

                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                  onPressed: ()async{
                    SharedPreferences prefs=await SharedPreferences.getInstance();
                    prefs.clear();
                  },
                  child: const Text(
                    "Clear",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text("Name : $savedName", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text("Age : $savedAge", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text("Roll No : $savedRollNo", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
