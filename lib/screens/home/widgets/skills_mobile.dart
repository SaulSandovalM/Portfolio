import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/skills_items.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Column(
        children: [
          // platform
          for (int i = 0; i < platformItems.length; i++)
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: CustomColor.bgLightOne,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                leading: Image.asset(platformItems[i]['img']),
                title: Text(platformItems[i]['title']),
              ),
            ),
          const SizedBox(height: 50),
          // skills
        ],
      ),
    );
  }
}
