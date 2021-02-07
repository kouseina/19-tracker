import 'package:nineteen_trackers/my_icons.dart';

class InformationModel {
  String icon;
  String title;
  String desc;
  String url;

  InformationModel({this.icon, this.title, this.desc, this.url});
}

List<InformationModel> infoContents = [
  InformationModel(
    icon: iconSpread,
    title: 'How it spread?',
    desc: 'Learn how COVID-19 spread',
    url:
        'https://health.detik.com/berita-detikhealth/d-5122703/berbagai-cara-penyebaran-virus-corona-covid-19-menurut-who-apa-saja',
  ),
  InformationModel(
    icon: iconSymptoms,
    title: 'Symptoms',
    desc: 'Learn how COVID-19 symptoms',
    url:
        'https://health.detik.com/berita-detikhealth/d-5363120/urutan-gejala-awal-virus-corona-yang-paling-banyak-dialami',
  ),
  InformationModel(
    icon: iconPrevention,
    title: 'Prevention and Treatment',
    desc: 'Learn about COVID-19 prevention and treatmen',
    url:
        'https://health.detik.com/berita-detikhealth/d-5048106/bagaimana-cara-mencegah-dan-menghindari-virus-corona',
  ),
  InformationModel(
    icon: iconSpread,
    title: 'How about mutations?',
    desc: 'Learn about COVID-19 mutation',
    url:
        'https://health.detik.com/berita-detikhealth/d-5357631/fakta-virus-d614g-mutasi-covid-19-yang-kini-mendominasi-termasuk-di-indonesia',
  ),
];
