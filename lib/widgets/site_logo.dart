import 'package:flutter/material.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          'SaulSandovalM',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
