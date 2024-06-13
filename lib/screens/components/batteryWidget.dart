import 'package:flutter/material.dart';
import 'package:tesla_app/constantis.dart';

class BatteryStatus extends StatelessWidget {
  const BatteryStatus({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: constraints.maxHeight * 0.02,
        ),
        Text(
          "250 کیلومتر تا اتمام شارژ",
          //textDirection: TextDirection.rtl,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.white,
                fontFamily: 'Anjoman',
              ),
        ),
        const Text(
          "ظرفیت باطری : 62%",
          style: TextStyle(fontSize: 20, color: Colors.amber),
        ),
        Spacer(),
        Text(
          "در حال شارژ".toUpperCase(),
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.white,
                fontSize: 25,
              ),
        ),
        SizedBox(
          height: 5,
        ),
        const Text(
          "20 دقیقه تا پر شدن",
          style: TextStyle(fontSize: 14, color: Colors.amber),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.14,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "سرعت : 20 کیلومتر بر ساعت",
                style: TextStyle(color: Colors.amber),
              ),
              Text("ولتاژ باطری : 220", style: TextStyle(color: Colors.amber)),
            ],
          ),
        ),
        const SizedBox(
          height: defulatPadding,
        ),
      ],
    );
  }
}
