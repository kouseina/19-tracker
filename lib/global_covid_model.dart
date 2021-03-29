import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nineteen_trackers/strings.dart';

class GlobalCovid {
  var confirmed;
  var recovered;
  var deaths;

  GlobalCovid({this.confirmed, this.recovered, this.deaths});

  factory GlobalCovid.createGlobalCovid(Map<String, dynamic> object) {
    var confirmedParent = object['confirmed'];
    var recoveredParent = object['recovered'];
    var deathsParent = object['deaths'];
    return GlobalCovid(
      confirmed: (confirmedParent as Map<String, dynamic>)['value'],
      recovered: (recoveredParent as Map<String, dynamic>)['value'],
      deaths: (deathsParent as Map<String, dynamic>)['value'],
    );
  }

  static Future<GlobalCovid> connectToApi() async {
    try {
      var apiResult = await http.get(Strings.global_api);
      var jsonObject = json.decode(apiResult.body);

      return GlobalCovid.createGlobalCovid(jsonObject);
    } catch (e) {
      print(e);
    }
  }
}
