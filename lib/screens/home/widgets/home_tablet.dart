import 'package:flutter/material.dart';
import 'package:portafolio/core/widgets/container.dart';
import 'package:portafolio/screens/home/widgets/main_desktop.dart';
import 'package:portafolio/screens/home/widgets/main_skills.dart';

class HomeTablet extends StatelessWidget {
  const HomeTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainContainer(
      child: Column(
        children: [
          MainDesktop(),
          SizedBox(height: 20),
          Text(
            'Habilidades',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          SizedBox(height: 20),
          MainSkills(),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
