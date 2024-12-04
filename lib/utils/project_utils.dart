class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String languages;
  final String androidLink;
  final String iosLink;
  final String webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.languages,
    this.androidLink = '',
    this.iosLink = '',
    this.webLink = '',
  });
}

List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: 'assets/images/w01.png',
    title: 'Orando',
    subtitle:
        'This is an English learning app for students to learn English through various methods.',
    languages: '',
    androidLink:
        'https://play.google.com/store/apps/details?id=kr.co.evolcano.donotstudy',
    iosLink:
        "https://apps.apple.com/kr/app/%EC%98%81%EC%96%B4%EB%A8%B8%EB%A6%AC-%EA%B3%B5%EC%9E%91%EC%86%8C/id1507102714",
  ),
];
