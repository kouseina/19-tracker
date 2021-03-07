class UnboardingModel {
  String image;
  String text;

  UnboardingModel({this.image, this.text});
}

List<UnboardingModel> contents = [
  // UnboardingModel(
  //     image: 'assets/images/img_intro1.jpg',
  //     text:
  //         'Informasi yang lengkap dan akurat seputar covid 19 hanya untuk kamu'),
  UnboardingModel(
      image: 'assets/images/img_intro2.jpg',
      text: 'Track data covid 19 hanya dari rumah saja'),
  UnboardingModel(
      image: 'assets/images/img_intro3.jpg',
      text: 'Cek gejala gejala yang dialami hanya dalam satu aplikasi saja'),
  UnboardingModel(
      image: 'assets/images/img_intro4.jpg',
      text: 'Dimana posisi kamu saat ini?'),
];
