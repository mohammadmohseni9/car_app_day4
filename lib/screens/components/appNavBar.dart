import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constantis.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({
    super.key,
    required this.SelectedTab,
    required this.onTap,
  });

  final int SelectedTab;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      enableFeedback: false,
      onTap: onTap,
      currentIndex: SelectedTab,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      items: List.generate(
        navIconAddress.length,
        (index) => BottomNavigationBarItem(
          icon: SvgPicture.asset(
            //navicon is list of svg address
            //with index i can accses to include list
            navIconAddress[index],
            color: index == SelectedTab ? primaryColor : Colors.white54,
            height: 40,
          ),
          label: NameNavigationIcon[index],
        ),
      ),
    );
  }
}

List<String> navIconAddress = [
  "assets/icons/Lock.svg",
  "assets/icons/Charge.svg",
  "assets/icons/temp2.svg",
  "assets/icons/Tyre.svg",
  "assets/icons/loc.svg",
];

List<String> NameNavigationIcon = [
  "قفل",
  "شارژ",
  "دما",
  "چرخ ها",
  "مکان",
];

