import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nineteen_trackers/my_icons.dart';
import 'package:nineteen_trackers/pages/statistic_page.dart';
import 'package:nineteen_trackers/pages/information_page.dart';
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
    StatisticPage(),
    InformationPage(),
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
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(iconHome),
              label: 'Beranda',
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
              label: 'Statistika'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(iconEdu),
              activeIcon: SvgPicture.asset(
                iconEdu,
                color: pinkColor,
              ),
              label: 'Informasi'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
