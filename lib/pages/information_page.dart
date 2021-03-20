import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nineteen_trackers/information_model.dart';
import 'package:nineteen_trackers/pages/information_webview_page.dart';
import 'package:nineteen_trackers/theme.dart';
import 'dart:async';

Future fetchStr() async {
  await new Future.delayed(const Duration(seconds: 1), () {});
  return 'hello world';
}

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: whiteColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 55, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 12),
                    child: Text(
                      'Informasi',
                      style: titleStyle,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Flexible(
                    flex: 1,
                    child: ListView(
                      children: infoContents.map((info) {
                        return Flexible(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => InformationWebviewPage(
                                              title: info.title,
                                              url: info.url,
                                            )));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffF2F2F2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 25),
                                  child: Flexible(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(info.icon),
                                        SizedBox(
                                          width: 22,
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                info.title,
                                                style: subtitleStyle.copyWith(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                info.desc,
                                                style: descStyle.copyWith(
                                                  color: greyColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        FutureBuilder(
            future:
                fetchStr(), // you should put here your method that call your web service
            builder: (context, snapshot) {
              /// The snapshot data type have to be same of the result of your web service method
              if (snapshot.hasData) {
                /// When the result of the future call respond and has data show that data
                return Stack();
              } else {
                return Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor),
                    ),
                  ),
                );
              }
            }

            /// While is no data show this
            ),
      ],
    );
  }
}
