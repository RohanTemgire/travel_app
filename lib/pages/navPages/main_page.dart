import 'package:flutter/material.dart';


import './bar_item_page.dart';
import '../home_page.dart';
import './my_page.dart';
import './search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List _pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage()
  ];
  int _currentIndex = 0;
  void _onTap(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black87,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        unselectedItemColor: Colors.grey.withOpacity(0.6),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
        BottomNavigationBarItem(icon: const Icon(Icons.apps),title: const Text('Home')),
        BottomNavigationBarItem(icon: const Icon(Icons.bar_chart),title: const Text('BarPage')),
        BottomNavigationBarItem(icon: const Icon(Icons.search_rounded),title: const Text('SearchPage')),
        BottomNavigationBarItem(icon: const Icon(Icons.person),title: const Text('MyPage')),
      ],),
    );
  }
}