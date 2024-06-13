import 'package:flutter/material.dart';
import 'package:tesla_app/constantis.dart';
import 'package:tesla_app/home_controller.dart';
import 'package:tesla_app/screens/components/btnTemp.dart';

class TempDetails extends StatelessWidget {
  const TempDetails({
    super.key,
    required HomeController controller,
  }) : _controller = controller;

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 110,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                btnTemp_cool_or_hot(
                  isActiveBtn: _controller.isCoolSelected,
                  title: "سرد",
                  svgSrc: "assets/icons/coolShape.svg",
                  press: _controller.updateTempSelecteTab,
                  //isActiveBtn: ,
                ),
                const SizedBox(
                  width: defulatPadding,
                ),
                btnTemp_cool_or_hot(
                  //به خاطر اینکه پیش فرض پرایمری کالر هست ما رنگ قرمز میدیدم بهش
                  activeBtnColor: redColor,
                  isActiveBtn: !_controller.isCoolSelected,
                  title: "گرم",
                  svgSrc: "assets/icons/heatShape.svg",
                  press: _controller.updateTempSelecteTab,
                  //isActiveBtn: ,
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              IconButton(
                onPressed: _controller.setTempUp,
                icon: const Icon(
                  Icons.arrow_drop_up,
                  size: 48,
                  color: redColor,
                ),
              ),
              Text(
                "\u2103" + _controller.TempRange.toString(),
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 48),
              ),
              IconButton(
                onPressed: _controller.SetTempdown,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 48,
                  color: primaryColor,
                ),
              ),
              const Text(
                "دمای کنونی",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          const SizedBox(
            height: defulatPadding,
          ),
          const Spacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "داخل",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "\u2103" + "20",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "خارج",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "\u2103" + "20",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
