import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:nineteen_trackers/custom_navigation.dart';
import 'package:nineteen_trackers/pages/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AfterLayout extends StatefulWidget {
  @override
  _AfterLayoutState createState() => _AfterLayoutState();
}

class _AfterLayoutState extends State<AfterLayout>
    with AfterLayoutMixin<AfterLayout> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new CustomNavigation()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new OnboardingPage()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
