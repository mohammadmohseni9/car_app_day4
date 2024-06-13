import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<Widget> Tyres(BoxConstraints constraints) {
  return [
    Positioned(
      top: constraints.maxHeight * 0.21,
      left: constraints.maxWidth * 0.19,
      child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),
    ),
    Positioned(
      top: constraints.maxHeight * 0.21,
      right: constraints.maxWidth * 0.19,
      child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),
    ),
    Positioned(
      bottom: constraints.maxHeight * 0.21,
      left: constraints.maxWidth * 0.19,
      child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),
    ),
    Positioned(
      bottom: constraints.maxHeight * 0.21,
      right: constraints.maxWidth * 0.19,
      child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),
    ),
  ];
}
