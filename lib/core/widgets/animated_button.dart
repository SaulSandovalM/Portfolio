import 'package:flutter/material.dart';

class AnimatedButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const AnimatedButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.deepPurpleAccent),
            color: Colors.deepPurple.withOpacity(0.1),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.deepPurpleAccent),
              const SizedBox(width: 8),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
