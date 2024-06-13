import 'package:flutter/material.dart';
import 'package:tesla_app/constantis.dart';
import 'package:tesla_app/models/TyrePsi.dart';

class TyrePsiCard extends StatelessWidget {
  const TyrePsiCard({
    super.key,
    required this.isBottomTwoTyre,
    required this.tyrepci,
  });

  final bool isBottomTwoTyre;
  final TyrePci tyrepci;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defulatPadding),
      decoration: BoxDecoration(
        color:
            tyrepci.isLowPressure ? redColor.withOpacity(0.2) : Colors.white24,
        border: Border.all(
            color: tyrepci.isLowPressure
                ? redColor.withOpacity(0.4)
                : primaryColor,
            width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: isBottomTwoTyre
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                tyrepci.isLowPressure
                    ? LowPressureText(context)
                    : NormalPressureText(context),
                const Spacer(),
                psiText(context, psi: tyrepci.psi.toString()),
                const SizedBox(
                  height: defulatPadding,
                ),
                Text(
                  "\u2103" + "${tyrepci.tempTyre}",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                psiText(context, psi: tyrepci.psi.toString()),
                const SizedBox(
                  height: defulatPadding,
                ),
                Text(
                  "\u2103" + "${tyrepci.tempTyre}",
                  style: const TextStyle(fontSize: 16),
                ),
                const Spacer(),
                tyrepci.isLowPressure
                    ? LowPressureText(context)
                    : NormalPressureText(context),
              ],
            ),
    );
  }

  // ignore: non_constant_identifier_names
  Column LowPressureText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "کم".toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.white, fontWeight: FontWeight.w900),
        ),
        Text(
          "فشار".toUpperCase(),
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Column NormalPressureText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "نرمال".toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.white, fontWeight: FontWeight.w900),
        ),
        Text(
          "فشار".toUpperCase(),
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Text psiText(BuildContext context, {required String psi}) {
    return Text.rich(
      TextSpan(
        text: psi,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(fontWeight: FontWeight.w700, color: Colors.white),
        children: const [
          TextSpan(
            text: "psi",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
