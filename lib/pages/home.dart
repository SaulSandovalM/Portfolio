import 'package:flutter/material.dart';
import 'package:portafolio/constants/colors.dart';
import 'package:portafolio/constants/size.dart';
import 'package:portafolio/constants/sns_links.dart';
import 'package:portafolio/widgets/drawer_mobile.dart';
import 'package:portafolio/widgets/footer.dart';
import 'package:portafolio/widgets/header_desktop.dart';
import 'package:portafolio/widgets/header_mobile.dart';
import 'package:portafolio/widgets/main_desktop.dart';
import 'package:portafolio/widgets/main_mobile.dart';
import 'package:portafolio/widgets/skill_desktop.dart';
import 'package:portafolio/widgets/skills_mobile.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

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
            : DrawerMobile(onNavItemTap: (int navIndex) {
                scaffoldKey.currentState?.closeEndDrawer();
                scrollToSection(navIndex);
              }),
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(key: navbarKeys.first),
              // AppBar
              if (constraints.maxWidth >= kMinDesktopWidth)
                HeaderDesktop(
                  onNavMenuTap: (int navIndex) {
                    scrollToSection(navIndex);
                  },
                )
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              // Home
              if (constraints.maxWidth >= kMinDesktopWidth)
                const MainDesktop()
              else
                const MainMobile(),
              // Skills
              Container(
                key: navbarKeys[1],
                margin: const EdgeInsets.symmetric(horizontal: 40),
                width: screenWidth,
                padding: const EdgeInsets.fromLTRB(0, 20, 25, 60),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'HABILIDADES',
                          style: TextStyle(
                            fontSize: 30,
                            color: CustomColor.whitePrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    if (constraints.maxWidth >= kMedDesktopWidth)
                      const SkillDesktop()
                    else
                      const SkillsMobile()
                  ],
                ),
              ),
              // const SizedBox(height: 30),
              // Projects
              // ProjectsSection(key: navbarKeys[2]),
              // const SizedBox(height: 30),
              // Contact
              // ContactSection(key: navbarKeys[3]),
              // Footer
              const Footer()
            ],
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) async {
    if (navIndex == 4) {
      // open a blog page using url_launcher
      final Uri url = Uri.parse(SnsLinks.blog);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
      return;
    }

    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
