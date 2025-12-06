
import 'package:end_project/pages/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controller1 = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome Everyone",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 50),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _controller1,
                      decoration: InputDecoration(
                        labelText: "username",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 217, 199, 248),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90),
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                    return "Please enter a username";
                  }
                  if (value.length < 3) {
                    return "Username must be at least 3 characters long";
                  }
                  return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    MaterialButton(
                      child: Text("Login", style: TextStyle(color: Colors.white),),
                      color: Colors.deepPurple,
                      onPressed: () async{
                        if(formkey.currentState!.validate()){
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString("username", _controller1.text);
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> WelcomePage(username: _controller1.text,)));
                        }
                      })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
