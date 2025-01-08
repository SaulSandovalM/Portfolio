import 'package:flutter/material.dart';
import 'package:portafolio/core/constants/colors.dart';
import 'package:portafolio/providers/data_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MainCourses extends StatelessWidget {
  const MainCourses({super.key});

  @override
  Widget build(BuildContext context) {
    final courseProvider =
        Provider.of<DataProvider<Map<String, dynamic>>>(context);

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
          _buildCourseList(context, courseProvider),
        ],
      ),
    );
  }

  Widget _buildIntroSection(BuildContext context) {
    return const Text(
      'La educación es una de las piedras angulares de la innovación...',
      style: TextStyle(
        color: CustomColor.textDesc,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.start,
    );
  }

  Widget _buildCourseList(
      BuildContext context, DataProvider<Map<String, dynamic>> provider) {
    return FutureBuilder(
      // future: provider.fetchCourses(),
      future: provider.fetchData(),
      builder: (context, snapshot) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final courses = provider.items ?? [];
        if (courses.isEmpty) {
          return const Center(
            child: Text(
              'No hay cursos disponibles.',
              style: TextStyle(color: Colors.white),
            ),
          );
        }

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
                (index) {
                  // final course = courses[index].data() as Map<String, dynamic>;
                  final course = courses[index];

                  return SizedBox(
                    width: itemWidth,
                    child: GestureDetector(
                      onTap: () => _launchCourseUrl(context, course),
                      child: Card.outlined(
                        color: CustomColor.backgroundBase,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(
                                  course['title'] ?? 'Sin título',
                                  style: const TextStyle(
                                    color: CustomColor.textFormColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  course['description']?.length > 100
                                      ? '${course['description']?.substring(0, 100)}...'
                                      : course['description'] ?? '',
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
                  );
                },
              ),
            );
          },
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
