import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:portafolio/core/constants/colors.dart';
import 'package:portafolio/core/layout/mobile_scaffold.dart';
import 'package:portafolio/core/layout/tablet_scaffold.dart';
import 'package:portafolio/core/layout/desktop_scaffold.dart';
import 'package:portafolio/screens/home/view/home.dart';
import 'package:portafolio/screens/projects/view/projects.dart';
import 'package:portafolio/screens/courses/view/courses.dart';
import 'package:portafolio/screens/conferences/view/conferences.dart';
import 'package:portafolio/screens/contact/view/contact.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        final width = MediaQuery.of(context).size.width;

        if (width < 600) {
          return MobileScaffold(child: child);
        } else if (width < 1100) {
          return TabletScaffold(child: child);
        } else {
          return DesktopScaffold(child: child);
        }
      },
      routes: _appRoutes,
    ),
  ],
);

final List<GoRoute> _appRoutes = [
  GoRoute(
    path: '/',
    name: 'home',
    builder: (context, state) => const Home(),
  ),
  GoRoute(
    path: '/projects',
    name: 'projects',
    builder: (context, state) => const Projects(),
  ),
  GoRoute(
    path: '/courses',
    name: 'courses',
    builder: (context, state) => const Courses(),
  ),
  GoRoute(
    path: '/conferences',
    name: 'conferences',
    builder: (context, state) => const Conferences(),
  ),
  GoRoute(
    path: '/contact',
    name: 'contact',
    builder: (context, state) => const Contact(),
  ),
];
