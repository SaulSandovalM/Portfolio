import 'package:flutter/material.dart';
import 'package:portafolio/core/widgets/header.dart';

class Base extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;

  const Base({
    super.key,
    required this.child,
    this.backgroundColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Column(
        children: [
          const Header(), // El header fijo en la parte superior.
          Expanded(
            child: child, // La vista dinámica se renderiza aquí.
          ),
        ],
      ),
    );
  }
}
