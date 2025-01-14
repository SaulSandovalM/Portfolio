import 'package:flutter/material.dart';
import 'package:portafolio/core/widgets/container.dart';
import 'package:portafolio/screens/home/widgets/main_desktop.dart';
import 'package:portafolio/screens/home/widgets/main_skills.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainContainer(
      child: Column(
        children: [
          SizedBox(height: 40),
          MainDesktop(),
          SizedBox(height: 30),
          Text(
            'Habilidades',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
            ),
          ),
          SizedBox(height: 30),
          MainSkills(),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
