import 'package:flutter/material.dart';
import 'package:portafolio/core/constants/colors.dart';
import 'package:portafolio/models/conference_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ConferenceCard extends StatelessWidget {
  final Conference conference;

  const ConferenceCard({super.key, required this.conference});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.buttonBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: CustomColor.border.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del evento
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              conference.image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.image_not_supported),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  conference.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${conference.location} · ${conference.date}',
                  style: TextStyle(
                    fontSize: 13,
                    color: CustomColor.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  conference.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: CustomColor.textSecondary,
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton.icon(
                    onPressed: () async {
                      final uri = Uri.parse(conference.videoUrl);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      }
                    },
                    icon: const Icon(Icons.play_circle, size: 18),
                    label: const Text("Ver video"),
                    style: TextButton.styleFrom(
                      foregroundColor: CustomColor.accent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
