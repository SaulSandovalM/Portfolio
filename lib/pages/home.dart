import 'package:flutter/material.dart';
import 'package:portafolio/constants/colors.dart';
import 'package:portafolio/constants/size.dart';
import 'package:portafolio/widgets/drawer_mobile.dart';
import 'package:portafolio/widgets/header_desktop.dart';
import 'package:portafolio/widgets/header_mobile.dart';
import 'package:portafolio/widgets/main_desktop.dart';
import 'package:portafolio/widgets/main_mobile.dart';
import 'package:portafolio/widgets/skill_desktop.dart';
import 'package:portafolio/widgets/skills_mobile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomColor.scaffoldBg,
        endDrawer: constraints.maxWidth >= kMinDesktopWidth
            ? null
            : const DrawerMobile(),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            // AppBar
            if (constraints.maxWidth >= kMinDesktopWidth)
              const HeaderDesktop()
            else
              const HeaderMobile(
                  // onLogoTap: () {},
                  // onMenuTap: () {
                  //   scaffoldKey.currentState?.openEndDrawer();
                  // },
                  ),
            // Home
            if (constraints.maxWidth >= kMinDesktopWidth)
              const MainDesktop()
            else
              const MainMobile(),
            // Skills
            Container(
              width: screenWidth,
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
              color: CustomColor.bgLightOne,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // title
                  const Text(
                    'What i can do',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary),
                  ),
                  // platform and skills
                  const SizedBox(height: 50),
                  if (constraints.maxWidth >= kMedDesktopWidth)
                    const SkillDesktop()
                  else
                    const SkillsMobile()
                ],
              ),
            ),
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
    });
  }
}
