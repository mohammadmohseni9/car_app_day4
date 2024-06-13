import 'package:flutter/material.dart';
import 'package:tesla_app/constantis.dart';
import 'package:flutter_svg/flutter_svg.dart';

class btnTemp_cool_or_hot extends StatelessWidget {
  const btnTemp_cool_or_hot({
    super.key,
    required this.svgSrc,
    required this.press,
    this.isActiveBtn = false,
    required this.title,
    this.activeBtnColor = primaryColor,
  });

  final String svgSrc, title;
  final bool isActiveBtn;
  final VoidCallback press;
  final Color activeBtnColor;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeInOutBack,
            height: isActiveBtn ? 76 : 50,
            width: isActiveBtn ? 76 : 50,
            child: SvgPicture.asset(
              svgSrc,
              color: isActiveBtn ? activeBtnColor : Colors.white60,
            ),
          ),
          AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 200),
            style: TextStyle(
                fontFamily: 'Anjoman',
                fontSize: isActiveBtn ? 18 : 14,
                color: isActiveBtn ? activeBtnColor : Colors.white60,
                fontWeight: isActiveBtn ? FontWeight.w700 : FontWeight.w400),
            child: Text(
              title,
            ),
          ),
        ],
      ),
    );
  }
}
