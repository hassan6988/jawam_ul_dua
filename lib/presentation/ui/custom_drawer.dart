import 'package:flutter/material.dart';
import 'package:jawam_ul_dua/generated/assets.dart';
import 'package:jawam_ul_dua/utils/const/colors.dart';
import 'package:jawam_ul_dua/utils/const/styles.dart';

import '../../router/app_routes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kWhiteColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: kSecondaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.pngAssetsAppIcon, height: 60),
                const SizedBox(height: 5),
                Text(
                  "Jawam Ul Dua",
                  style: AppStyles.w500f16poppins.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("About"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, RouteName.aboutScreen);
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text("Privacy Policy"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, RouteName.privacyPolicy);
            },
          ),
        ],
      ),
    );
  }
}
