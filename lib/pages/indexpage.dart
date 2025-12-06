import 'package:end_project/pages/account.dart';
import 'package:end_project/pages/favorite.dart';
import 'package:end_project/pages/homepage.dart';
import 'package:end_project/pages/login.dart';
import 'package:end_project/widgets/texsts_style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Indexpage extends StatefulWidget {
  const Indexpage({super.key, required this.name});
  final String name;

  @override
  State<Indexpage> createState() => _IndexpageState();
}

class _IndexpageState extends State<Indexpage> {
  int _indexPage = 0;
  List <Widget> pages = [
    Homepage(),
    FavoritePage(),
    AccountPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: 15,top: 7),
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            // child: ClipRRect(
            //   borderRadius: BorderRadius.all(Radius.circular(10)),
            //   child: Image.asset("assets/images/11.jpg",)),

          )
        ],
      ),
      drawer: Drawer(
        child: Column(children: [
          DrawerHeader(child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.deepPurpleAccent,
              ),
              SizedBox(width: 10,),
              MidStyle(text: "Hello ${widget.name}",)
            ],
          )),
          ListTile(
            onTap: (){
              Navigator.pop(context);
              setState(() {
                _indexPage =0;
              });
            },
            title:MidStyle(text: "Home") ,
            trailing: Icon(Icons.home),
          ),
          ListTile(
            onTap: (){
              Navigator.pop(context);
              setState(() {
                _indexPage =1;
              });
            },
            title:MidStyle(text: "Favorite") ,
            trailing: Icon(Icons.favorite),
          ),
          ListTile(
            onTap: (){
              Navigator.pop(context);
              setState(() {
                _indexPage =2;
              });
            },
            title:MidStyle(text: "account") ,
            trailing: Icon(Icons.account_box),
          ),
          ListTile(
            onTap: () async {
             final prefs = await SharedPreferences.getInstance();
                  await prefs.remove("username");

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Login()),
                  );
            },
            title:MidStyle(text: "sign out") ,
            trailing: Icon(Icons.logout),
          ),
          


        ],),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexPage,
        onTap: (index) {
          setState(() {
            _indexPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), label: ""),
      ]),
      body: IndexedStack(
        index: _indexPage,
        children: pages,
      ),
    );
  }
}
