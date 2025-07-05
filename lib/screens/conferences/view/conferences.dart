import 'package:flutter/material.dart';
import 'package:portafolio/core/widgets/container.dart';
import 'package:portafolio/screens/conferences/widgets/conference_section.dart';
import 'package:provider/provider.dart';
import 'package:portafolio/providers/conferences_provider.dart';

class Conferences extends StatefulWidget {
  const Conferences({super.key});

  @override
  State<Conferences> createState() => _ConferencesState();
}

class _ConferencesState extends State<Conferences> {
  @override
  void initState() {
    super.initState();
    Provider.of<ConferencesProvider>(context, listen: false).loadConferences();
  }

  @override
  Widget build(BuildContext context) {
    return const MainContainer(
      child: ConferenceSection(),
    );
  }
}
