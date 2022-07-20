import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'displayText.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();
  String name = '';

  @override
  void initState() {
    controller.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(90.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
            ),
            ElevatedButton(
                onPressed: () {
                  if(controller.text!=''){
                    save(controller.text);
                  }
                },
                child: const Icon(Icons.save)) ,

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            DisplayData();
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Display(name)));
          },
          child: const Icon(Icons.check)),
    );
  }

  void save(String text) async {
    var sharedPre = await SharedPreferences.getInstance();
    sharedPre.setString('key-name', text);
  }

  void DisplayData() async {
    var sharedPre = await SharedPreferences.getInstance();
    var text = sharedPre.getString('key-name');

    setState(() {
      name = text ?? '';
    });
  }
}