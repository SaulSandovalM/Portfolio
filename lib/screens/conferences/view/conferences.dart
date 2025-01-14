import 'package:flutter/material.dart';
import 'package:portafolio/core/widgets/container.dart';
import 'package:portafolio/screens/conferences/widgets/main_conferences.dart';

class Conferences extends StatelessWidget {
  const Conferences({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainContainer(
      child: Column(
        children: [
          MainConferences(),
        ],
      ),
    );
  }
}
