import 'package:flutter/material.dart';
import 'package:portafolio/screens/home/widgets/home_desktop.dart';
import 'package:portafolio/screens/home/widgets/home_mobile.dart';
import 'package:portafolio/screens/home/widgets/home_tablet.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return const HomeMobile();
    } else if (width < 770) {
      return const HomeTablet();
    } else {
      return const HomeDesktop();
    }
  }
}
