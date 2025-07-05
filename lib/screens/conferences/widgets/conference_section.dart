import 'package:flutter/material.dart';
import 'package:portafolio/models/conference_model.dart';
import 'package:portafolio/providers/conferences_provider.dart';
import 'package:portafolio/screens/conferences/widgets/conference_card.dart';
import 'package:provider/provider.dart';
import 'package:portafolio/core/constants/colors.dart';

class ConferenceSection extends StatelessWidget {
  const ConferenceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ConferencesProvider>(context);
    final categories = provider.categories;

    return Column(
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
            : constraints.maxWidth > 600
                ? 2
                : constraints.maxWidth > 580
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
            childAspectRatio: constraints.maxWidth > 1000
                ? 1
                : constraints.maxWidth > 600
                    ? 1.2
                    : constraints.maxWidth > 580
                        ? 0.7
                        : 0.8,
          ),
          itemBuilder: (context, index) {
            return ConferenceCard(conference: conferences[index]);
          },
        );
      },
    );
  }
}
