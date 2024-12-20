import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portafolio/core/constants/colors.dart';
import 'package:portafolio/core/widgets/header.dart';
import 'package:portafolio/screens/contact/view/contact.dart';
import 'package:portafolio/screens/home/view/home.dart';
import 'package:portafolio/screens/projects/view/projects.dart';
import 'package:portafolio/screens/skills/view/skills.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          backgroundColor: CustomColor.backgroundBase,
          body: Column(
            children: [
              const Header(),
              Expanded(child: child),
            ],
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const Home(),
        ),
        GoRoute(
          path: '/projects',
          builder: (context, state) => const Projects(),
        ),
        GoRoute(
          path: '/skills',
          builder: (context, state) => const Skills(),
        ),
        GoRoute(
          path: '/contact',
          builder: (context, state) => const Contact(),
        ),
      ],
    ),
  ],
);
