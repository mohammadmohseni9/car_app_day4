import 'package:flutter/material.dart';
import 'package:tesla_app/constantis.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoorLock extends StatelessWidget {
  const DoorLock({
    required this.press,
    required this.islock,
  });

  final VoidCallback press;
  final bool islock;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        //when click icon run update func
        onTap: press,
        child: AnimatedSwitcher(
          switchInCurve: Curves.easeInOutBack,
          duration: defaultDuratuion,
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
          child: islock
              ? SvgPicture.asset(
                  "assets/icons/door_lock.svg",
                  key: const ValueKey("lock"),
                )
              : SvgPicture.asset(
                  "assets/icons/door_unlock.svg",
                  key: const ValueKey("unlcok"),
                ),
        ));
  }
}
