import 'dart:math';

import '../../core/core.dart';

class FAB extends StatefulWidget {
  // final bool toogle;
  const FAB({
    Key? key,
  }) : super(key: key);

  @override
  State<FAB> createState() => _FABState();
}

class _FABState extends State<FAB> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  Alignment alignment1 = const Alignment(0.0, 0.96);
  Alignment alignment2 = const Alignment(0.0, 0.96);
  Alignment alignment3 = const Alignment(0.0, 0.96);

  double size1 = 10;
  double size2 = 10;
  double size3 = 10;
  final controller = Get.find<DashboardController>();
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      reverseDuration: const Duration(milliseconds: 275),
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );
    animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width, // duration: const Duration(milliseconds: 1),
      // color: Colors.white,
      child: Stack(
        children: [
          if (controller.toogle == false)
            Container(
              width: Get.width,
              height: Get.height,
              color: const Color(0x00101010).withOpacity(0.87),
            ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Stack(
              children: [
                IconFAB(
                  onTap: () {
                    controller.selectedIndex.value = 4;
                    if (controller.toogle = !controller.toogle) {
                      animationController.reverse();
                      alignment1 = const Alignment(0.0, 0.96);
                      alignment2 = const Alignment(0.0, 0.96);
                      alignment3 = const Alignment(0.0, 0.96);
                      size1 = size2 = size3 = 10.0;
                    }
                  },
                  color: ColorApp.blue,
                  alignment: alignment1,
                  size: size1,
                  toogle: controller.toogle,
                  icon: 'assets/icons/pemasukan.svg',
                  title: "Pemasukan",
                ),
                IconFAB(
                  onTap: () {
                    controller.selectedIndex.value = 5;
                    if (controller.toogle = !controller.toogle) {
                      animationController.reverse();
                      alignment1 = const Alignment(0.0, 0.96);
                      alignment2 = const Alignment(0.0, 0.96);
                      alignment3 = const Alignment(0.0, 0.96);
                      size1 = size2 = size3 = 10.0;
                    }
                  },
                  color: ColorApp.green,
                  alignment: alignment2,
                  size: size2,
                  toogle: controller.toogle,
                  icon: 'assets/icons/kamar.svg',
                  title: "Penghuni",
                ),
                IconFAB(
                  onTap: () {
                    controller.selectedIndex.value = 6;
                    if (controller.toogle = !controller.toogle) {
                      animationController.reverse();
                      alignment1 = const Alignment(0.0, 0.96);
                      alignment2 = const Alignment(0.0, 0.96);
                      alignment3 = const Alignment(0.0, 0.96);
                      size1 = size2 = size3 = 10.0;
                    }
                  },
                  alignment: alignment3,
                  size: size3,
                  toogle: controller.toogle,
                  icon: 'assets/icons/pengeluaran.svg',
                  title: "Pengeluaran",
                  color: ColorApp.red,
                ),
                Align(
                  alignment: const Alignment(0, 1),
                  child: Transform.rotate(
                    angle: animation.value * pi * (1 / 4),
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                        color: ColorApp.orange,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      duration: const Duration(milliseconds: 375),
                      curve: Curves.easeOut,
                      height: 50.0,
                      width: 50.0,
                      child: Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          splashColor: Colors.black54,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              'assets/icons/elementplus.svg',
                              // height: 30,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              if (controller.toogle) {
                                controller.toogle = !controller.toogle;
                                animationController.forward();
                                Future.delayed(const Duration(milliseconds: 10),
                                    () {
                                  alignment1 = const Alignment(-0.32, 0.88);
                                  size1 = 50.0;
                                });
                                Future.delayed(
                                    const Duration(milliseconds: 100), () {
                                  alignment2 = const Alignment(0.0, 0.80);
                                  size2 = 50.0;
                                });
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  alignment3 = const Alignment(0.32, 0.88);
                                  size3 = 50.0;
                                });
                              } else {
                                controller.toogle = !controller.toogle;
                                animationController.reverse();
                                alignment1 = const Alignment(0.0, 0.96);
                                alignment2 = const Alignment(0.0, 0.96);
                                alignment3 = const Alignment(0.0, 0.96);
                                size1 = size2 = size3 = 10.0;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
