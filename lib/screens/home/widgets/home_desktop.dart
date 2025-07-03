import 'package:flutter/material.dart';
import 'package:portafolio/core/widgets/container.dart';
import 'package:portafolio/screens/home/widgets/main_desktop.dart';
import 'package:portafolio/screens/home/widgets/main_skills.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainDesktop(),
          Text(
            'Habilidades',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
            ),
          ),
          SizedBox(height: 30),
          MainSkills(),
        ],
      ),
    );
  }
}
