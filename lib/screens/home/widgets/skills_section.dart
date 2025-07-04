import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portafolio/core/constants/colors.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;

  final Map<String, List<_Skill>> skillGroups = {
    'Frameworks': [
      _Skill(icon: FontAwesomeIcons.flutter, label: 'Flutter'),
      _Skill(icon: FontAwesomeIcons.react, label: 'React'),
      _Skill(icon: FontAwesomeIcons.nodeJs, label: 'Node.js'),
      _Skill(icon: FontAwesomeIcons.unity, label: 'Unity'),
    ],
    'Backend & Base de Datos': [
      _Skill(icon: FontAwesomeIcons.fire, label: 'Firebase'),
      _Skill(icon: FontAwesomeIcons.database, label: 'SQL'),
      _Skill(icon: FontAwesomeIcons.lock, label: 'Auth (JWT/OAuth)'),
      _Skill(icon: FontAwesomeIcons.python, label: 'Django'),
    ],
    'DevOps & Herramientas': [
      _Skill(icon: FontAwesomeIcons.gitAlt, label: 'Git'),
      _Skill(icon: FontAwesomeIcons.github, label: 'GitHub'),
      _Skill(icon: FontAwesomeIcons.linux, label: 'Linux'),
      _Skill(icon: FontAwesomeIcons.vial, label: 'Testing (Unit / E2E)'),
    ],
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeIn,
      child: Column(
        children: skillGroups.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                child: Text(
                  entry.key,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.accent,
                  ),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount = constraints.maxWidth > 1000
                      ? 4
                      : constraints.maxWidth > 600
                          ? 3
                          : constraints.maxWidth > 580
                              ? 2
                              : 1;

                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: entry.value.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: 1.6,
                    ),
                    itemBuilder: (context, index) {
                      return _SkillCard(skill: entry.value[index]);
                    },
                  );
                },
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _Skill {
  final IconData icon;
  final String label;

  _Skill({required this.icon, required this.label});
}

class _SkillCard extends StatefulWidget {
  final _Skill skill;

  const _SkillCard({required this.skill});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
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
                        color: CustomColor.accent.withOpacity(0.4),
                        blurRadius: 20,
                        spreadRadius: 2,
                        offset: const Offset(0, 0),
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
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(widget.skill.icon,
                        size: 36, color: CustomColor.accent),
                    const SizedBox(height: 12),
                    Text(
                      widget.skill.label,
                      style: const TextStyle(
                        color: CustomColor.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
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
