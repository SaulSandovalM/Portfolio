import 'package:flutter/material.dart';
import 'package:portafolio/models/course_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portafolio/core/constants/colors.dart';

class CourseCard extends StatefulWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  bool _hovered = false;
  double _x = 0;
  double _y = 0;

  void _onHover(PointerEvent event, BoxConstraints constraints) {
    final center = constraints.biggest.center(Offset.zero);
    final dx = (event.localPosition.dx - center.dx) / center.dx;
    final dy = (event.localPosition.dy - center.dy) / center.dy;

    setState(() {
      _x = dy * 10;
      _y = -dx * 10;
    });
  }

  void _onExit(PointerEvent _) {
    setState(() {
      _hovered = false;
      _x = 0;
      _y = 0;
    });
  }

  void _onEnter(PointerEvent _) {
    setState(() {
      _hovered = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return MouseRegion(
          onEnter: _onEnter,
          onHover: (event) => _onHover(event, constraints),
          onExit: _onExit,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: CustomColor.buttonBackground,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _hovered
                    ? CustomColor.accent
                    : CustomColor.border.withOpacity(0.3),
              ),
              boxShadow: _hovered
                  ? [
                      BoxShadow(
                        color: CustomColor.accent.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ]
                  : [],
            ),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(_x * 0.01745)
                ..rotateY(_y * 0.01745),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Imagen del curso
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        widget.course.coverPath,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Título
                    Text(
                      widget.course.title,
                      style: const TextStyle(
                        color: CustomColor.textPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Descripción
                    Text(
                      widget.course.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: CustomColor.textSecondary,
                        fontSize: 14,
                      ),
                    ),

                    const Spacer(),

                    // Tecnologías
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: widget.course.tech
                          .map((tech) => Chip(
                                label: Text(tech),
                                backgroundColor:
                                    CustomColor.accent.withOpacity(0.1),
                                labelStyle: const TextStyle(
                                  color: CustomColor.accent,
                                  fontSize: 12,
                                ),
                                side: BorderSide.none,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 16),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton.icon(
                        onPressed: () async {
                          final uri = Uri.parse(widget.course.url);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          }
                        },
                        icon: const Icon(Icons.play_circle_outline, size: 16),
                        label: const Text('Ir al curso'),
                        style: TextButton.styleFrom(
                          foregroundColor: CustomColor.accent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
