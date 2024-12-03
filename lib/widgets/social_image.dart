import 'package:flutter/material.dart';
import 'package:portafolio/utils/social_utils.dart';

class SocialImageWidget extends StatelessWidget {
  const SocialImageWidget({super.key, required this.icon});

  final SocialUtils icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 150,
      width: 260,
      child: Column(
        children: [
          Image.asset(
            icon.image,
            height: 100,
            width: 100,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
