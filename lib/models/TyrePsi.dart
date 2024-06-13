// ignore: camel_case_types
class TyrePci {
  final double psi;
  final int tempTyre;
  bool isLowPressure;

  void lowpressueCheck() {
    if (psi >= 30) {
      isLowPressure = false;
    } else {
      isLowPressure = true;
    }
  }

  TyrePci(
      {required this.psi, required this.tempTyre, required this.isLowPressure});
}

final List<TyrePci> demoPsiList = [
  TyrePci(psi: 35.5, tempTyre: 56, isLowPressure: true),
  TyrePci(psi: 23.0, tempTyre: 35, isLowPressure: false),
  TyrePci(psi: 30.6, tempTyre: 41, isLowPressure: false),
  TyrePci(psi: 25.1, tempTyre: 41, isLowPressure: true),
];
