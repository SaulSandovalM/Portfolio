import 'package:flutter/material.dart';
import 'package:portafolio/core/constants/colors.dart';
import 'package:portafolio/core/constants/courses.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = (constraints.maxWidth - 20) / 1;
        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            courses.length,
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
                          courses[index]['title']!,
                          style: const TextStyle(
                            color: CustomColor.textFormColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          courses[index]['description']!.length > 100
                              ? '${courses[index]['description']!.substring(0, 100)}...'
                              : courses[index]['description']!,
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
  }
}

class CourseDetailPage extends StatelessWidget {
  final int courseIndex;

  const CourseDetailPage({required this.courseIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Curso $courseIndex'),
      ),
      body: Center(
        child: Text(
          'Bienvenido al curso $courseIndex',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

    // return MainContainer(
    //   child: ListView.separated(
    //     padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
    //     itemCount: projects.length,
    //     itemBuilder: (context, index) {
    //       final project = projects[index];
    //       return Card(
    //         shape: const RoundedRectangleBorder(
    //           borderRadius: BorderRadius.zero,
    //         ),
    //         child: Container(
    //           decoration: const BoxDecoration(
    //             color: CustomColor.backgroundBase,
    //             border: Border(
    //               top: BorderSide(
    //                 color: CustomColor.navBorder,
    //                 width: 1,
    //               ),
    //             ),
    //           ),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Image.network(
    //                 project['image']!,
    //                 width: double.infinity,
    //                 height: 200,
    //                 fit: BoxFit.cover,
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Text(
    //                   project['title']!,
    //                   style: const TextStyle(
    //                     color: CustomColor.projectTitleColor,
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 20,
    //                   ),
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
    //                 child: Text(
    //                   project['description']!,
    //                   style: const TextStyle(
    //                     color: CustomColor.textDesc,
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     },
    //     separatorBuilder: (BuildContext context, int index) => const Divider(
    //       color: CustomColor.navBorder,
    //     ),
    //   ),
    // );
