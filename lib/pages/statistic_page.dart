import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nineteen_trackers/kmb_generator.dart';
import 'package:nineteen_trackers/my_icons.dart';
import 'package:nineteen_trackers/theme.dart';
import 'package:nineteen_trackers/widgets/alert_stay.dart';
import 'package:nineteen_trackers/widgets/line_chart.dart';

class StatisticPage extends StatelessWidget {
  double lCasePure = 1174779;
  double lDeathPure = 31976;
  double lRecoverPure = 973452;

  @override
  Widget build(BuildContext context) {
    var lCase = k_m_b_generator(lCasePure);
    var lDeath = k_m_b_generator(lDeathPure);
    var lRecover = k_m_b_generator(lRecoverPure);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 55,
            ),
            Text(
              'Statistika',
              style: titleStyle,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: LineChartWidget(),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
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
                                lCase,
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
                                lDeath,
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
                                lRecover,
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
                // AlertStay(),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      )),
    );
  }
}
