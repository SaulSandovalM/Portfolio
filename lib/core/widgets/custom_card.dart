import 'package:flutter/material.dart';
import 'package:portafolio/core/constants/colors.dart';

class CustomCard extends StatefulWidget {
  final Widget child;

  const CustomCard({super.key, required this.child});

  @override
  State<CustomCard> createState() => CustomCardState();
}

class CustomCardState extends State<CustomCard> {
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
                child: widget.child,
              ),
            ),
          ),
        );
      },
    );
  }
}
