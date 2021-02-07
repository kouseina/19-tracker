import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nineteen_trackers/my_icons.dart';
import 'package:nineteen_trackers/theme.dart';
import 'package:nineteen_trackers/widgets/alert_stay.dart';

class StatisticPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 55, 30, 15),
            child: Text(
              'Statistika',
              style: titleStyle,
            ),
          ),
          Expanded(
            child: Image.asset('assets/images/img_statistics.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 40,
                            offset: Offset(0, 0),
                            spreadRadius: 0)
                      ]),
                  child: Column(
                    children: [
                      Text(
                        'Kasus di Indonesia',
                        style: subtitleStyle.copyWith(fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                '192 K',
                                style: titleStyle.copyWith(fontSize: 22),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Kasus',
                                    style: descStyle.copyWith(
                                        color: Color(0xffBCC0C5), fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SvgPicture.asset(iconArrowUp),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                '11 K',
                                style: titleStyle.copyWith(
                                    fontSize: 22, color: blackColor),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Meninggal',
                                    style: descStyle.copyWith(
                                        color: Color(0xffBCC0C5), fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SvgPicture.asset(
                                    iconArrowUp,
                                    color: blackColor,
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                '100 K',
                                style: titleStyle.copyWith(
                                    fontSize: 22, color: greenColor),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Sembuh',
                                    style: descStyle.copyWith(
                                        color: Color(0xffBCC0C5), fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SvgPicture.asset(
                                    iconArrowUp,
                                    color: greenColor,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AlertStay(),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
