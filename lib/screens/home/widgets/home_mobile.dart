import 'package:flutter/material.dart';
import 'package:portafolio/core/widgets/container.dart';
import 'package:portafolio/screens/home/widgets/main_desktop.dart';
import 'package:portafolio/screens/home/widgets/main_skills.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MainDesktop(),
          SizedBox(height: 24),
          Text(
            'Habilidades',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          MainSkills(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
