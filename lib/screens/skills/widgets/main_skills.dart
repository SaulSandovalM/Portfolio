import 'package:flutter/material.dart';
import 'package:portafolio/core/constants/skills_items.dart';
import 'package:portafolio/core/widgets/container.dart';
import 'package:portafolio/screens/skills/widgets/badge_card.dart';

class MainSkills extends StatelessWidget {
  const MainSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemBuilder: (context, index) {
          return BadgeCard(
            title: badges[index]['title']!,
            imagePath: badges[index]['image']!,
          );
        },
        itemCount: badges.length,
      ),
    );
  }
}
