import 'package:flutter/material.dart';
import 'package:lab_task_5/pages/account.dart';
import 'package:lab_task_5/pages/home.dart';
import 'package:lab_task_5/pages/search.dart';
import 'package:lab_task_5/pages/settings.dart';


class Indexpage extends StatefulWidget {
  const Indexpage({super.key});

  @override
  State<Indexpage> createState() => _IndexpageState();
}

class _IndexpageState extends State<Indexpage> {
  int _IndexNavBar =0;
  List <Widget> pages = [
    HomePage(),
    SearchPage(),
    SettingsPage(),
    AccountPage()
  ];
  
  String _getchoice(int indexpage)
  {
    switch(indexpage){
      case 0:
      return "Home Page";
      case 1:
      return "Search Page";
      case 2:
      return "Settings Page";
      case 3:
      return "Account Page";
      default:
      return "Data";
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(_getchoice(_IndexNavBar)),),
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _IndexNavBar,
        elevation: 80.0,
        unselectedItemColor:  Colors.grey,
        selectedItemColor: Colors.amber,
        iconSize: 40,
        onTap: (index) {
          setState(() {
            _IndexNavBar = index;
          });
        },
        items: [
        BottomNavigationBarItem(label: "home" , icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: "search" , icon: Icon(Icons.search)),
        BottomNavigationBarItem(label: "settings" , icon: Icon(Icons.settings)),
        BottomNavigationBarItem(label: "account" , icon: Icon(Icons.account_box)),
      ]) ,
      body: IndexedStack(
        index: _IndexNavBar,
        children:pages ,
      ),
    );
  }
}