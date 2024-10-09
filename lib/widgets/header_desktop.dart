import 'package:flutter/material.dart';
import 'package:portafolio/constants/colors.dart';
import 'package:portafolio/constants/nav_items.dart';
import 'package:portafolio/styles/style.dart';
import 'package:portafolio/widgets/site_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      decoration: kHeaderDecoration,
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
                      color: CustomColor.whitePrimary),
                ),
              ))
      ]),
    );
  }
}
