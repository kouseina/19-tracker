import 'package:flutter/material.dart';
import 'package:nineteen_trackers/global_covid_model.dart';
import 'package:nineteen_trackers/local_covid_model.dart';
import 'package:nineteen_trackers/kmb_generator.dart';
import 'package:nineteen_trackers/theme.dart';
import 'package:nineteen_trackers/widgets/alert_stay.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // double gCasePure = 106855561;
  // double gDeathPure = 2337714;
  // double gRecoverPure = 59690884;
  double lCasePure = 1174779;
  double lDeathPure = 31976;
  double lRecoverPure = 973452;

  GlobalCovid globalCovid = null;
  LocalCovid localCovid = null;

  @override
  Widget build(BuildContext context) {
    var lCase = k_m_b_generator(lCasePure);
    var lDeath = k_m_b_generator(lDeathPure);
    var lRecover = k_m_b_generator(lRecoverPure);

    final globalCovidApi = GlobalCovid.connectToApi();
    final localCovidApi = LocalCovid.connectToApi();

    globalCovidApi.then((value) => {globalCovid = value});
    localCovidApi.then((value) => {localCovid = value});

    return FutureBuilder(
      future:
          globalCovidApi, // you should put here your method that call your web service
      builder: (context, snapshot) {
        /// The snapshot data type have to be same of the result of your web service method
        if (snapshot.connectionState == ConnectionState.done) {
          /// When the result of the future call respond and has data show that data
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
                            'Ringkasan',
                            style: titleStyle,
                          ),
                          Text(
                            'Coronavirus adalah penyakit menular yang disebabkan oleh virus corona yang baru ditemukan',
                            style: titleStyle.copyWith(
                                fontSize: 13,
                                color: Color(0xff333333),
                                fontWeight: FontWeight.w300),
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
                          FutureBuilder(
                            future: globalCovidApi,
                            builder: (ctx, snapshot) {
                              var value = (snapshot.connectionState ==
                                      ConnectionState.done)
                                  ? k_m_b_generator(globalCovid.confirmed)
                                  : '0';
                              return Text(
                                value,
                                style: titleStyle.copyWith(fontSize: 45),
                              );
                            },
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
                                  'MENINGGAL',
                                  style: subtitleStyle,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                FutureBuilder(
                                  future: globalCovidApi,
                                  builder: (ctx, snapshot) {
                                    var value = (snapshot.connectionState ==
                                            ConnectionState.done)
                                        ? k_m_b_generator(globalCovid.deaths)
                                        : '0';
                                    return Text(
                                      value,
                                      style: titleStyle.copyWith(
                                          color: blackColor, fontSize: 30),
                                    );
                                  },
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
                                  'SEMBUH',
                                  style: subtitleStyle,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                FutureBuilder(
                                  future: globalCovidApi,
                                  builder: (ctx, snapshot) {
                                    var value = (snapshot.connectionState ==
                                            ConnectionState.done)
                                        ? k_m_b_generator(globalCovid.recovered)
                                        : '0';
                                    return Text(
                                      value,
                                      style: titleStyle.copyWith(
                                          color: greenColor, fontSize: 30),
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: Text(
                                    'Total Kasus Di',
                                    style: subtitleStyle,
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: ChooseCountry(),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
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
                                    Text(
                                      'Kasus',
                                      style: descStyle.copyWith(
                                          color: Color(0xffBCC0C5),
                                          fontSize: 15),
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
                                    Text(
                                      'Meninggal',
                                      style: descStyle.copyWith(
                                          color: Color(0xffBCC0C5),
                                          fontSize: 15),
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
                                    Text(
                                      'Sembuh',
                                      style: descStyle.copyWith(
                                          color: Color(0xffBCC0C5),
                                          fontSize: 15),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      AlertStay(),
                    ],
                  ),
                )
              ],
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

class ChooseCountry extends StatefulWidget {
  @override
  _ChooseCountryState createState() => _ChooseCountryState();
}

class _ChooseCountryState extends State<ChooseCountry> {
  String valueChoose = "Indonesia";
  List listItem = [
    "Indonesia",
    // "Amerika Serikat",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      padding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton(
        iconSize: 30,
        isExpanded: true,
        underline: SizedBox(),
        style: subtitleStyle,
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
    );
  }
}
