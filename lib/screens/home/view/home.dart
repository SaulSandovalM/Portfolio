import 'package:flutter/material.dart';
import 'package:portafolio/screens/home/widgets/main_desktop.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MainDesktop(),
    );
  }
}