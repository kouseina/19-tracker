import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nineteen_trackers/local_covid_model.dart';
import 'package:nineteen_trackers/kmb_generator.dart';
import 'package:nineteen_trackers/my_icons.dart';
import 'package:nineteen_trackers/theme.dart';
import 'package:nineteen_trackers/widgets/alert_stay.dart';
import 'package:nineteen_trackers/widgets/line_chart.dart';

class StatisticPage extends StatefulWidget {
  @override
  _StatisticPageState createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  double lCasePure = 1174779;
  double lDeathPure = 31976;
  double lRecoverPure = 973452;

  LocalCovid localCovid = null;

  @override
  Widget build(BuildContext context) {
    var lCase = k_m_b_generator(lCasePure);
    var lDeath = k_m_b_generator(lDeathPure);
    var lRecover = k_m_b_generator(lRecoverPure);

    final localCovidApi = LocalCovid.connectToApi();

    localCovidApi.then((value) => {localCovid = value});

    return FutureBuilder(
      future:
          localCovidApi, // you should put here your method that call your web service
      builder: (context, snapshot) {
        /// The snapshot data type have to be same of the result of your web service method
        if (snapshot.connectionState == ConnectionState.done) {
          /// When the result of the future call respond and has data show that data
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
                                    FutureBuilder(
                                      future: localCovidApi,
                                      builder: (ctx, snapshot) {
                                        var value = (snapshot.connectionState ==
                                                ConnectionState.done)
                                            ? k_m_b_generator(
                                                localCovid.confirmed)
                                            : '0';
                                        return Text(
                                          value,
                                          style:
                                              titleStyle.copyWith(fontSize: 22),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: 9,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Kasus',
                                          style: descStyle.copyWith(
                                              color: Color(0xffBCC0C5),
                                              fontSize: 15),
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
                                    FutureBuilder(
                                      future: localCovidApi,
                                      builder: (ctx, snapshot) {
                                        var value = (snapshot.connectionState ==
                                                ConnectionState.done)
                                            ? k_m_b_generator(localCovid.deaths)
                                            : '0';
                                        return Text(
                                          value,
                                          style: titleStyle.copyWith(
                                              fontSize: 22, color: blackColor),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: 9,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Meninggal',
                                          style: descStyle.copyWith(
                                              color: Color(0xffBCC0C5),
                                              fontSize: 15),
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
                                    FutureBuilder(
                                      future: localCovidApi,
                                      builder: (ctx, snapshot) {
                                        var value = (snapshot.connectionState ==
                                                ConnectionState.done)
                                            ? k_m_b_generator(
                                                localCovid.recovered)
                                            : '0';
                                        return Text(
                                          value,
                                          style: titleStyle.copyWith(
                                              fontSize: 22, color: greenColor),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: 9,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Sembuh',
                                          style: descStyle.copyWith(
                                              color: Color(0xffBCC0C5),
                                              fontSize: 15),
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

        /// While is no data show this
        return Center(
          child: CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          ),
        );
      },
    );
  }
}
