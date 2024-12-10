import 'package:flutter/material.dart';
import 'package:portafolio/screens/home/widgets/site_logo.dart';

import '../../../core/constants/colors.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});

  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: CustomColor.navBarBg,
        border: Border.all(
          color: CustomColor.navBorder,
          width: 2.0,
        ),
      ),
      child: Row(
        children: [
          SiteLogo(
            onTap: onLogoTap,
          ),
          const Spacer(),
          IconButton(onPressed: onMenuTap, icon: const Icon(Icons.menu)),
          const SizedBox(width: 15)
        ],
      ),
    );
  }
}
