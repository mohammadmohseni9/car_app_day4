import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_app/constantis.dart';
import 'package:tesla_app/home_controller.dart';
import 'package:tesla_app/models/TyrePsi.dart';
import 'package:tesla_app/screens/components/TyrepsiandCard.dart';
import 'package:tesla_app/screens/components/batteryWidget.dart';
import 'package:tesla_app/screens/components/doorLock.dart';
import 'package:tesla_app/screens/components/temp_details.dart';
import 'package:tesla_app/screens/components/tyre.dart';

import 'components/appNavBar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final HomeController _controller = HomeController();

  late AnimationController _BatteryAnimationController;
  late Animation<double> _animationBattery;
  late Animation<double> _animationBatteryLevelStatus;

  late AnimationController _tempAnimationController;
  late Animation<double> _animationCarshift;

  late Animation<double> _animationShowTempInfo;
  late Animation<double> _animationCoolGlow;

  late AnimationController _locationController;
  late Animation<double> _carLocationshift;

  late AnimationController _tyreAnimationController;
  late Animation<double> _animateTyrePsi1;
  late Animation<double> _animateTyrePsi2;
  late Animation<double> _animateTyrePsi3;
  late Animation<double> _animateTyrePsi4;
  late List<Animation<double>> _tyreAnimation;

  late AnimationController _ShowGpsDiologController;
  late Animation<double> _locGps;

  void setupShowLocation() {
    _ShowGpsDiologController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _locGps = CurvedAnimation(
      parent: _ShowGpsDiologController,
      curve: const Interval(0.45, 0.65),
    );
  }

  void setupTyreAnimation() {
    _tyreAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    _animateTyrePsi1 = CurvedAnimation(
      parent: _tyreAnimationController,
      curve: Interval(0.34, 0.5),
    );
    _animateTyrePsi2 = CurvedAnimation(
      parent: _tyreAnimationController,
      curve: Interval(0.5, 0.66),
    );
    _animateTyrePsi3 = CurvedAnimation(
      parent: _tyreAnimationController,
      curve: Interval(0.66, 0.82),
    );
    _animateTyrePsi4 = CurvedAnimation(
      parent: _tyreAnimationController,
      curve: Interval(0.82, 1),
    );
  }

  void carShiftLoc() {
    _locationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _carLocationshift = CurvedAnimation(
      parent: _locationController,
      curve: const Interval(0.1, 0.3),
    );
  }

  void setupBatteryAnimation() {
    _BatteryAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _animationBattery = CurvedAnimation(
      parent: _BatteryAnimationController,
      curve: const Interval(0.3, 0.5),
    );

    _animationBatteryLevelStatus = CurvedAnimation(
        parent: _BatteryAnimationController, curve: const Interval(0.6, 1));
  }

  void setupTempAnimation() {
    _tempAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // _animationCarshift = CurvedAnimation(
    //   parent: _tempAnimationController,
    //   curve: const Interval(0.2, 0.4),
    // );

    _animationShowTempInfo = CurvedAnimation(
      parent: _tempAnimationController,
      curve: const Interval(0.45, 0.65),
    );
    _animationCoolGlow = CurvedAnimation(
      parent: _tempAnimationController,
      curve: const Interval(0.7, 1),
    );
  }

  @override
  void initState() {
    setupBatteryAnimation();
    setupTempAnimation();
    setupTyreAnimation();

    setupShowLocation();
    _tyreAnimation = [
      _animateTyrePsi1,
      _animateTyrePsi2,
      _animateTyrePsi3,
      _animateTyrePsi4
    ];
    carShiftLoc();
    super.initState();
  }

  @override
  void dispose() {
    _BatteryAnimationController.dispose();
    _tempAnimationController.dispose();

    _tyreAnimationController.dispose();
    _locationController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: const Locale('fa', 'IR'),
      child: AnimatedBuilder(
          animation: Listenable.merge([
            _controller,
            _BatteryAnimationController,
            _tempAnimationController,
            _tyreAnimationController,
            _locationController,
            _ShowGpsDiologController,
          ]),
          builder: (context, _) {
            return Scaffold(
              body: SafeArea(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: constraints.maxHeight,
                          width: constraints.maxWidth,
                        ),

                        Positioned(
                          left: constraints.maxWidth /
                              2 *
                              _locationController.value,
                          height: constraints.maxHeight,
                          width: constraints.maxWidth,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: constraints.maxHeight * 0.1),
                            child: SvgPicture.asset(
                              "assets/icons/Car.svg",
                              width: double.infinity,
                            ),
                          ),
                        ),
                        //for left icon lock

                        AnimatedPositioned(
                          duration: defaultDuratuion,
                          left: _controller.selectedBottomNavBar == 0
                              ? constraints.maxWidth * 0.03
                              : constraints.maxWidth / 2.2,
                          //for click on icon lock
                          child: AnimatedOpacity(
                            duration: defaultDuratuion,
                            opacity:
                                _controller.selectedBottomNavBar == 0 ? 1 : 0,
                            child: DoorLock(
                              islock: _controller.isLeftDoorLock,
                              press: _controller.UpdateLeftDoorLock,
                            ),
                          ),
                        ),
                        //for right icon lock
                        AnimatedPositioned(
                          duration: defaultDuratuion,
                          right: _controller.selectedBottomNavBar == 0
                              ? constraints.maxWidth * 0.03
                              : constraints.maxWidth / 2.2,
                          //for click on icon lock
                          child: AnimatedOpacity(
                            duration: defaultDuratuion,
                            opacity:
                                _controller.selectedBottomNavBar == 0 ? 1 : 0,
                            child: DoorLock(
                              islock: _controller.isRightDoorLock,
                              press: _controller.UpdateRightDoorLock,
                            ),
                          ),
                        ),
                        //for top icon lock
                        AnimatedPositioned(
                          duration: defaultDuratuion,
                          top: _controller.selectedBottomNavBar == 0
                              ? constraints.maxHeight * 0.16
                              : constraints.maxHeight / 2.1,
                          //for click on icon lock
                          child: AnimatedOpacity(
                            duration: defaultDuratuion,
                            opacity:
                                _controller.selectedBottomNavBar == 0 ? 1 : 0,
                            child: DoorLock(
                              islock: _controller.isTopDoorLock,
                              press: _controller.UpdateTopDoorLock,
                            ),
                          ),
                        ),
                        //for bottom icon lock
                        AnimatedPositioned(
                          duration: defaultDuratuion,
                          bottom: _controller.selectedBottomNavBar == 0
                              ? constraints.maxHeight * 0.17
                              : constraints.maxHeight / 2.2,
                          //for click on icon lock
                          child: AnimatedOpacity(
                            duration: defaultDuratuion,
                            opacity:
                                _controller.selectedBottomNavBar == 0 ? 1 : 0,
                            child: DoorLock(
                              islock: _controller.isBottomtDoorLock,
                              press: _controller.UpdateBottomtDoorLock,
                            ),
                          ),
                        ),
                        //Battery image
                        Opacity(
                          opacity: _animationBattery.value,
                          child: SvgPicture.asset(
                            "assets/icons/Battery.svg",
                            width: constraints.maxWidth * 0.45,
                          ),
                        ),
                        Positioned(
                          top: 50 * (1 - _animationBatteryLevelStatus.value),
                          height: constraints.maxHeight,
                          width: constraints.maxWidth,
                          child: Opacity(
                            opacity: _animationBatteryLevelStatus.value,
                            child: BatteryStatus(
                              constraints: constraints,
                            ),
                          ),
                        ),

                        Positioned(
                          top: 40 * (1 - _animationShowTempInfo.value),
                          height: constraints.maxHeight,
                          width: constraints.maxWidth,
                          child: Opacity(
                            opacity: _animationShowTempInfo.value,
                            child: TempDetails(controller: _controller),
                          ),
                        ),
                        Positioned(
                          right: -180 * (1 - _animationCoolGlow.value),
                          width: 200,
                          child: AnimatedSwitcher(
                            duration: defaultDuratuion,
                            child: _controller.isCoolSelected
                                ? Image.asset(
                                    "assets/images/Cglow.png",
                                    key: UniqueKey(),
                                  )
                                : Image.asset("assets/images/Hglow.png",
                                    key: UniqueKey()),
                          ),
                        ),
                        if (_controller.isShowTyre) ...Tyres(constraints),

                        if (_controller.isTyreShowStatus)
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: defulatPadding,
                                    crossAxisSpacing: defulatPadding,
                                    childAspectRatio: constraints.maxWidth /
                                        constraints.maxHeight),
                            itemBuilder: (context, index) => ScaleTransition(
                              scale: _tyreAnimation[index],
                              child: TyrePsiCard(
                                tyrepci: demoPsiList[index],
                                isBottomTwoTyre: index > 1,
                              ),
                            ),
                          ),

                        if (_controller.isLocationStatus)
                          Positioned(
                            top: 150 * (1 - _locGps.value),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.3),
                                  border: Border.all(
                                      color: primaryColor, width: 3)),
                              width: constraints.maxHeight / 3.5,
                              height: constraints.maxWidth * 1.2,
                              margin: EdgeInsets.only(
                                  right: constraints.maxWidth / 3),
                              child: Center(
                                  child: Text(
                                "مکان خودروی شما",
                              )),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
              bottomNavigationBar: AppNavBar(
                onTap: (index) {
                  if (index == 1)
                    _BatteryAnimationController.forward();
                  else if (_controller.selectedBottomNavBar == 1 && index != 1)
                    _BatteryAnimationController.reverse(from: 0.7);

                  if (index == 2) {
                    _tempAnimationController.forward();
                    _locationController.forward();
                  } else if (_controller.selectedBottomNavBar == 2 &&
                      index != 2) {
                    _tempAnimationController.reverse(from: 0.4);
                    _locationController.reverse();
                  }
                  if (index == 3) {
                    _tyreAnimationController.forward();
                  } else if (_controller.selectedBottomNavBar == 3 &&
                      index != 3) {
                    _tyreAnimationController.reverse();
                  }

                  if (index == 4) {
                    _locationController.forward();
                  } else if (_controller.selectedBottomNavBar == 4 &&
                      index != 4 &&
                      index != 2) _locationController.reverse();

                  _controller.tyreStatusController(index);

                  _controller.ShowTyreIcon(index);
                  // _controller.showCar(index);
                  _controller.GPSStatusController(index);
                  _controller.onBottomNavigationTabChange(index);
                },
                SelectedTab: _controller.selectedBottomNavBar,
              ),
            );
          }),
    );
  }
}
