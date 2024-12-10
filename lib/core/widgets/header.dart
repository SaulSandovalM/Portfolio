import 'package:flutter/material.dart';
import 'package:portafolio/core/constants/colors.dart';
import 'package:portafolio/core/constants/nav_items.dart';
import 'package:portafolio/screens/home/widgets/site_logo.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      shadowColor: Colors.black.withOpacity(0.5),
      child: Container(
        height: 60,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: CustomColor.navBarBg,
          border: Border(
            bottom: BorderSide(
              color: CustomColor.navBorder, // Color del borde
              width: 1, // Ancho del borde
            ),
          ),
        ),
        child: Row(children: [
          SiteLogo(
            onTap: () {},
          ),
          const Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  navTitles[i],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: CustomColor.navText,
                  ),
                ),
              ),
            )
        ]),
      ),
    );
  }
}
