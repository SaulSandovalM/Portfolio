import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  final Widget child;

  const MainContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(40, 40, 40, 0),
      constraints: const BoxConstraints(minHeight: 350),
      child: child,
    );
  }
}
