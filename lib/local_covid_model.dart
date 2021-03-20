import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nineteen_trackers/strings.dart';

class LocalCovid {
  var confirmed;
  var recovered;
  var deaths;

  LocalCovid({this.confirmed, this.recovered, this.deaths});

  factory LocalCovid.createLocalCovid(Map<String, dynamic> object) {
    var confirmedParent = object['confirmed'];
    var recoveredParent = object['recovered'];
    var deathsParent = object['deaths'];
    return LocalCovid(
      confirmed: (confirmedParent as Map<String, dynamic>)['value'],
      recovered: (recoveredParent as Map<String, dynamic>)['value'],
      deaths: (deathsParent as Map<String, dynamic>)['value'],
    );
  }

  static Future<LocalCovid> connectToApi() async {
    var apiResult = await http.get(Strings.local_api);
    var jsonObject = json.decode(apiResult.body);

    return LocalCovid.createLocalCovid(jsonObject);
  }
}
