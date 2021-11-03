import 'package:flutter/material.dart';
import 'package:tet_health/screens/pages/PatientMain.dart';
import 'package:tet_health/screens/pages/PatientData.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    PatientMain(),
    PatientData(),
  ];
void _onTap(int index)=> setState(() => currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  _widgetOptions[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: currentIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Мед.Данные',
          ),
          /*BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Я',
           )*/
        ],
      ),
    );
  }
}
