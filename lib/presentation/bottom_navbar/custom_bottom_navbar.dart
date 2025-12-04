import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jawam_ul_dua/generated/assets.dart';
import 'package:jawam_ul_dua/presentation/explore/explore_screen.dart';
import 'package:jawam_ul_dua/presentation/learning_screen/learning_screen.dart';
import 'package:jawam_ul_dua/presentation/ui/home_screen.dart';
import 'package:jawam_ul_dua/utils/const/colors.dart';

import '../learning_screen/revise_names_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int index;

  const CustomBottomNavBar({super.key, this.index = 0});

  @override
  CustomBottomNavBarState createState() => CustomBottomNavBarState();
}

class CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: _getSelectedWidget(_selectedIndex),
        bottomNavigationBar: SafeArea(
          child: Container(
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.75),
              border: const Border(
                top: BorderSide(color: Color(0x30000000), width: 0.33),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(icon: Assets.svgHomeIcon, index: 0),
                _buildNavItem(icon: Assets.svgLearnIcon, index: 1),
                _buildNavItem(icon: Assets.svgJounal, index: 2),
                _buildNavItem(icon: Assets.svgMirrorOfFlame, index: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({required String icon, required int index}) {
    bool isSelected = _selectedIndex == index;

    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? kSecondaryColor : Colors.transparent,
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            width: 24,
            height: 24,
            color: isSelected ? kWhiteColor : kBlackColor,
          ),
        ),
      ),
    );
  }

  Widget _getSelectedWidget(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const LearningScreen();
      case 2:
        return const ReviseNamesScreen();
      case 3:
        return ExploreScreen();
      default:
        return const Center(child: Text("Home"));
    }
  }
}
