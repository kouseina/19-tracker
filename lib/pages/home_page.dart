import 'package:flutter/material.dart';
import 'package:nineteen_trackers/theme.dart';
import 'package:nineteen_trackers/widgets/alert_stay.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 55, 5, 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Summary',
                      style: titleStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Coronavirus adalah penyakit menular yang disebabkan oleh virus corona yang baru ditemukan',
                      style: descStyle,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'KASUS DI DUNIA',
                      style: subtitleStyle,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '94,2 M',
                      style: titleStyle.copyWith(fontSize: 50),
                    ),
                  ],
                )),
                Image.asset(
                  'assets/images/img_summary.png',
                  width: 168,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Meninggal',
                            style: subtitleStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '94,2 M',
                            style: titleStyle.copyWith(
                                color: blackColor, fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Sembuh',
                            style: subtitleStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '94,2 M',
                            style: titleStyle.copyWith(
                                color: greenColor, fontSize: 30),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                AlertStay(),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'TOTAL KASUS DI INDONESIA',
                      style: subtitleStyle,
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                '12,1 K',
                                style: titleStyle.copyWith(fontSize: 22),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Text(
                                'Kasus',
                                style: descStyle.copyWith(
                                    color: Color(0xffBCC0C5), fontSize: 15),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                '12,1 K',
                                style: titleStyle.copyWith(
                                    fontSize: 22, color: blackColor),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Text(
                                'Meninggal',
                                style: descStyle.copyWith(
                                    color: Color(0xffBCC0C5), fontSize: 15),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                '12,1 K',
                                style: titleStyle.copyWith(
                                    fontSize: 22, color: greenColor),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Text(
                                'Sembuh',
                                style: descStyle.copyWith(
                                    color: Color(0xffBCC0C5), fontSize: 15),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
