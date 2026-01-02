import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FunctionsProvider extends ChangeNotifier{
  String name="";
  String age="";
  String rollNo="";

  // Save Data
  Future<void> saveData(String name, String age, String rollNo) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString("name", name);
  await prefs.setString("age", age);
  await prefs.setString("rollNo", rollNo);

  this.name = name;
  this.age = age;
  this.rollNo = rollNo;

  notifyListeners();
}


  // Read Data
  Future<void>readData() async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    name=prefs.getString("name")??"";
    age=prefs.getString("age")??"";
    rollNo=prefs.getString("rollNo")??"";

    notifyListeners();
  }

  // Clear Data
  Future<void>clearData() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    await prefs.clear();
    name="";
    age="";
    rollNo="";

    notifyListeners();
  }
  
}