import 'package:flutter/material.dart';
import 'package:portafolio/core/constants/colors.dart';
import 'package:portafolio/core/constants/project_items.dart';
import 'package:portafolio/core/widgets/container.dart';

class MainProjects extends StatelessWidget {
  const MainProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: CustomColor.backgroundBase,
                border: Border(
                  top: BorderSide(
                    color: CustomColor.navBorder,
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    project['image']!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      project['title']!,
                      style: const TextStyle(
                        color: CustomColor.projectTitleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      project['description']!,
                      style: const TextStyle(
                        color: CustomColor.textDesc,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: CustomColor.navBorder,
        ),
      ),
    );
  }
}
