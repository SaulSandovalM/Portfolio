import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portafolio/core/constants/colors.dart';

class MainProjects extends StatelessWidget {
  const MainProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 60,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          _buildCourseList(context),
        ],
      ),
    );
  }

  Widget _buildCourseList(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('projects')
          .orderBy('createdAt', descending: false)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text(
              'Error al cargar los proyectos.',
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        final projects = snapshot.data?.docs ?? [];
        if (projects.isEmpty) {
          return const Center(
            child: Text(
              'No hay proyectos disponibles.',
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            final itemWidth = (constraints.maxWidth - 20) / 1;
            return Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(
                projects.length,
                (index) => SizedBox(
                  width: itemWidth,
                  child: Card(
                    color: CustomColor.backgroundBase,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            'https://images.pexels.com/photos/2774556/pexels-photo-2774556.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          ListTile(
                            title: Text(
                              projects[index]['title']!,
                              style: const TextStyle(
                                color: CustomColor.textFormColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              projects[index]['description']!.length > 100
                                  ? '${projects[index]['description']!.substring(0, 100)}...'
                                  : projects[index]['description']!,
                              style: const TextStyle(
                                color: CustomColor.textDesc,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Divider(
                            color: CustomColor.navBorder,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
