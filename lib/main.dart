import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const DemoPage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var nameController=TextEditingController();

  static const String KEYNAME="name";
  var nameValue="No Value Saved";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Name")
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12)
              ),
              child: TextButton(onPressed: () async {
              
                var name=nameController.text.trim().toString();

                var prefs= await SharedPreferences.getInstance();

                prefs.setString(KEYNAME, name);

  
              }, child:Text("Save",style: TextStyle(
                fontSize: 17,   
                color: Colors.white
              ),)),
            ),
            Text(nameValue),
          ],
        ),
      ),
    );
  }
  
  void getValue() async{
    var prefs=await SharedPreferences.getInstance();

    var getName=prefs.getString(KEYNAME);

    nameValue=getName!=null?getName:"No Value Saved";

    setState(() {
      
    });
  }
}
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
