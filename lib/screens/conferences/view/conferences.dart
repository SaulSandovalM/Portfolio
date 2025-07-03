import 'package:flutter/material.dart';
import 'package:portafolio/models/conference_model.dart';
import 'package:portafolio/screens/conferences/widgets/conference_card.dart';
import 'package:provider/provider.dart';
import 'package:portafolio/core/constants/colors.dart';
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
    final provider = Provider.of<ConferencesProvider>(context);
    final categories = provider.categories;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Conferencias',
            style: TextStyle(
              color: CustomColor.textPrimary,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          for (final category in categories) ...[
            Text(
              category,
              style: const TextStyle(
                color: CustomColor.accent,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            _ConferenceGrid(
              conferences: provider.conferencesByCategory(category),
            ),
            const SizedBox(height: 32),
          ],
        ],
      ),
    );
  }
}

class _ConferenceGrid extends StatelessWidget {
  final List<Conference> conferences;

  const _ConferenceGrid({required this.conferences});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 1000
            ? 3
            : constraints.maxWidth > 700
                ? 2
                : 1;

        return GridView.builder(
          shrinkWrap: true,
          itemCount: conferences.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            return ConferenceCard(conference: conferences[index]);
          },
        );
      },
    );
  }
}
