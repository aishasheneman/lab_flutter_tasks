import 'package:flutter/material.dart';
import 'package:lab_task_3/second_screen.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _usercontroler = TextEditingController();
  final TextEditingController _passcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen",style: TextStyle(color: Colors.white , fontSize: 25),),
        backgroundColor: const Color.fromARGB(255, 214, 68, 240),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usercontroler,
              decoration: InputDecoration(
                labelText: "username",
                border: OutlineInputBorder(),
              ),
            ),
            
            SizedBox(height: 25),
            TextField(
              controller: _passcontroler,
              decoration: InputDecoration(
                labelText: "password",
                border: OutlineInputBorder(),
              ),
            ),
            
            SizedBox(height: 25),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 214, 68, 240) , fixedSize: Size(230, 50)),
              onPressed: () {
                setState(() {
                  _passcontroler.text =
                      _usercontroler.text; 
                });
              },
              child: Text("print text", style: TextStyle(color: Colors.white , fontSize: 22),),
            ),

            SizedBox(height: 25),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 214, 68, 240) , fixedSize: Size(230, 50)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondScreen(username: _usercontroler.text)));
                // setState(() {
                //   _passcontroler.text =
                //       _usercontroler.text; 
                // });
              },
              child: Text("Go to screen 2", style: TextStyle(color: Colors.white , fontSize: 22),),
            ),
          ],
        ),
      ),
    );
  }
}
