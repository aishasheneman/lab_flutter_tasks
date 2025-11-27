import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _usercontroler = TextEditingController();
  final TextEditingController _passcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usercontroler,
              decoration: InputDecoration(
                labelText: "username",
                focusColor: Colors.amber,
                
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
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber , fixedSize: Size(230, 50)),
              onPressed: () {
                setState(() {
                  _passcontroler.text =
                      _usercontroler.text; 
                });
              },
              child: Text("print text", style: TextStyle(color: Colors.white , fontSize: 22),),
            ),
          ],
        ),
      );
  }
}
