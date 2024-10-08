import 'package:flutter/material.dart';
import 'package:portafolio/constants/colors.dart';
import 'package:portafolio/constants/nav_items.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.scaffoldBg,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          // AppBar
          Container(
            height: 60,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [CustomColor.bgDarkOne, CustomColor.bgDarkOne],
              ),
            ),
            child: Row(children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'SaulSandovalM',
                  style: TextStyle(color: Colors.white),
                ),
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
          ),
          // Skills
          Container(
              height: 500, width: double.maxFinite, color: Colors.blueGrey),
          // Projects
          const SizedBox(height: 500, width: double.maxFinite),
          // Contact
          Container(
              height: 500, width: double.maxFinite, color: Colors.blueGrey),
          // Footer
          const SizedBox(height: 500, width: double.maxFinite)
        ],
      ),
    );
  }
}
