import 'package:flutter/material.dart';
import 'package:nineteen_trackers/custom_navigation.dart';
import 'package:nineteen_trackers/theme.dart';
import 'package:nineteen_trackers/unboarding_model.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  PageController _controller;
  String valueChoose;
  List listItem = [
    "Indonesia",
  ];

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    contents.length, (index) => buildDot(index, context)),
              ),
            ),
            Expanded(
              child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(35, 70, 35, 40),
                      child: Column(
                        children: [
                          Image.asset(
                            contents[i].image,
                            height: 260,
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              contents[i].text,
                              textAlign: TextAlign.center,
                              style: subtitleStyle.copyWith(
                                  fontSize: 21,
                                  fontWeight: FontWeight.normal,
                                  color: blackColor),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            currentIndex == contents.length - 1
                ? Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                    padding: const EdgeInsets.symmetric(
                      vertical: 3,
                      horizontal: 20,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton(
                      hint: Text('Pilih negara '),
                      iconSize: 36,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      // icon: Icon(Icons.arrow_drop_down),
                      value: valueChoose,
                      onChanged: (newValue) {
                        setState(() {
                          valueChoose = newValue;
                        });
                      },
                      items: listItem.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  )
                : SizedBox(
                    height: 0,
                  ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 55,
              margin: EdgeInsets.fromLTRB(30, 0, 30, 35),
              width: double.infinity,
              child: FlatButton(
                onPressed: currentIndex == contents.length - 1
                    ? valueChoose == null
                        ? null
                        : () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => CustomNavigation()));
                          }
                    : () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 100),
                            curve: Curves.bounceIn);
                      },
                child: Text(
                  currentIndex == contents.length - 1 ? 'Continue' : 'Next',
                  style: subtitleStyle.copyWith(
                    color: whiteColor,
                    fontSize: 18,
                  ),
                ),
                color: Theme.of(context).primaryColor,
                textColor: whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                disabledColor: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 30 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
