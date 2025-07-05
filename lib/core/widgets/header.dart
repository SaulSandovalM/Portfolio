import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portafolio/core/constants/colors.dart';
import 'package:portafolio/core/constants/nav_items.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool showMenu = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    final currentRoute = GoRouterState.of(context).uri.toString();

    return Container(
      decoration: BoxDecoration(
        color: CustomColor.backgroundBase.withOpacity(0.95),
        border: const Border(
          bottom: BorderSide(color: CustomColor.border, width: 0.7),
        ),
        boxShadow: [
          BoxShadow(
            color: CustomColor.accent.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 64,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => context.go('/'),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'SaulSandovalM',
                      style: TextStyle(
                        color: CustomColor.navText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                if (!isMobile)
                  Row(
                    children: List.generate(navTitles.length, (i) {
                      final isActive = currentRoute == navRoutes[i];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: GestureDetector(
                          onTap: () => context.go(navRoutes[i]),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: isActive
                                  ? CustomColor.accent.withOpacity(0.1)
                                  : Colors.transparent,
                            ),
                            child: Text(
                              navTitles[i],
                              style: TextStyle(
                                color: isActive
                                    ? CustomColor.accent
                                    : CustomColor.navText,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  )
                else
                  IconButton(
                    icon: Icon(
                      showMenu ? Icons.close : Icons.menu,
                      color: CustomColor.accent,
                    ),
                    onPressed: () => setState(() => showMenu = !showMenu),
                  ),
              ],
            ),
          ),
          if (isMobile && showMenu)
            Column(
              children: List.generate(navTitles.length, (i) {
                final isActive = currentRoute == navRoutes[i];
                return ListTile(
                  title: Text(
                    navTitles[i],
                    style: TextStyle(
                      color:
                          isActive ? CustomColor.accent : CustomColor.navText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    setState(() => showMenu = false);
                    context.go(navRoutes[i]);
                  },
                );
              }),
            ),
        ],
      ),
    );
  }
}
