import 'package:flutter/material.dart';
import 'package:portafolio/core/constants/colors.dart';
import 'package:portafolio/core/constants/courses.dart';
import 'package:url_launcher/url_launcher.dart';

class MainCourses extends StatelessWidget {
  const MainCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 60,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(child: _buildIntroSection(context)),
              if (MediaQuery.of(context).size.width > 880)
                const Expanded(
                  flex: 1,
                  child: Text(''),
                ),
            ],
          ),
          const SizedBox(height: 40),
          const Row(
            children: [
              Text(
                'Cursos',
                style: TextStyle(
                  color: CustomColor.navText,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
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
          _buildCourseList(context),
        ],
      ),
    );
  }

  Widget _buildIntroSection(BuildContext context) {
    return const Text(
      'La educación es una de las piedras angulares de la innovación. Es por eso que me complace compartir mi experiencia y conocimientos a través de una serie de cursos diseñados para capacitar a futuros profesionales en el mundo del desarrollo y la tecnología.',
      style: TextStyle(
        color: CustomColor.textDesc,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.start,
    );
  }

  Widget _buildCourseList(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth < 800
            ? 1
            : (courses.length < 3 ? courses.length : 3);
        final itemWidth = (constraints.maxWidth - 20) / columns;
        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            courses.length,
            (index) => SizedBox(
              width: itemWidth,
              child: GestureDetector(
                onTap: () => _launchCourseUrl(context, courses[index]),
                child: Card.outlined(
                  color: CustomColor.backgroundBase,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _launchCourseUrl(BuildContext context, link) async {
    final url = Uri.parse(link['link']!);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No se pudo abrir el enlace.'),
        ),
      );
    }
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
