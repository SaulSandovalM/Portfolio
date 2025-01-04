import 'package:flutter/material.dart';
import 'package:portafolio/core/constants/colors.dart';
import 'package:portafolio/core/widgets/container.dart';
import 'package:url_launcher/url_launcher.dart';

class MainCourses extends StatelessWidget {
  const MainCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'La educación es una de las piedras angulares de la innovación. Es por eso que me complace compartir mi experiencia y conocimientos a través de una serie de cursos diseñados para capacitar a futuros profesionales en el mundo del desarrollo y la tecnología.',
                      style: TextStyle(
                        color: CustomColor.textDesc,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Row(
                children: [
                  Text(
                    'Cursos',
                    style: TextStyle(
                      color: CustomColor.navText,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Row(
                children: [
                  Text(
                    'Unity',
                    style: TextStyle(
                      color: CustomColor.textFormColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              LayoutBuilder(
                builder: (context, constraints) {
                  final itemWidth = (constraints.maxWidth - 20) / 3;
                  return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      4,
                      (index) => SizedBox(
                        width: itemWidth,
                        child: GestureDetector(
                          onTap: () async {
                            final url = Uri.parse(
                                'https://www.youtube.com/watch?v=dQw4w9WgXcQ&index=${index + 1}');
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'No se pudo abrir el enlace.',
                                  ),
                                ),
                              );
                            }
                          },
                          child: Card.outlined(
                            color: CustomColor.backgroundBase,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    title: Text(
                                      'Curso ${index + 1}',
                                      style: const TextStyle(
                                        color: CustomColor.textFormColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      'Descripción del curso ${index + 1}',
                                      style: const TextStyle(
                                        color: CustomColor.textDesc,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
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
