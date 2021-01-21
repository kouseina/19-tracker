import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nineteen_trackers/my_icons.dart';
import 'package:nineteen_trackers/pages/chart_page.dart';
import 'package:nineteen_trackers/pages/home_page.dart';
import 'package:nineteen_trackers/theme.dart';

class CustomNavigation extends StatefulWidget {
  @override
  _CustomNavigationState createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ChartPage(),
    Text('Edu-Cov'),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(iconHome),
              title: Text('Home'),
              activeIcon: SvgPicture.asset(
                iconHome,
                color: pinkColor,
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(iconChart),
              activeIcon: SvgPicture.asset(
                iconChart,
                color: pinkColor,
              ),
              title: Text('Chart')),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(iconEdu),
              activeIcon: SvgPicture.asset(
                iconEdu,
                color: pinkColor,
              ),
              title: Text('Edu-Cov')),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
