import 'package:flutter/material.dart';
import 'package:portafolio/constants/colors.dart';
import 'package:portafolio/styles/style.dart';
import 'package:portafolio/widgets/header_desktop.dart';
import 'package:portafolio/widgets/site_logo.dart';

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
          // const HeaderDesktop(),
          Container(
            height: 50,
            margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
            decoration: kHeaderDecoration,
            child: Row(
              children: [
                SiteLogo(
                  onTap: () {},
                ),
                const Spacer(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
              ],
            ),
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
