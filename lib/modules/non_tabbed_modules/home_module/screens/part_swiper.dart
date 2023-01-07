import 'package:attendanceapp/modules/non_tabbed_modules/scan_module/screens/scan_screen.dart';
import 'package:attendanceapp/themes/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class PartSwiper extends StatefulWidget {
  const PartSwiper({super.key});

  @override
  State<StatefulWidget> createState() => _PartSwiper();
}

class _PartSwiper extends State<PartSwiper>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation<double> animPosition;
  late Animation<double> animOpacity;

  @override
  void initState() {
    initChevronUpAnimation();
    super.initState();
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  initChevronUpAnimation() {
    animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
      reverseDuration: const Duration(milliseconds: 400),
    );

    animPosition = Tween<double>(begin: 10, end: 0).animate(
      CurvedAnimation(
        parent: animController,
        curve: Curves.easeInCubic,
      ),
    )..addListener(() => setState(() {}));
    // Always repeat animation
    animController.repeat(reverse: true);
  }

  openScanModal(BuildContext ctx) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: ModuleScan(
            height: MediaQuery.of(ctx).size.height,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        // print("panning: ${details.delta.dy}");
        if (details.delta.dy < 0) {
          if (kDebugMode) {
            print("panning swipe up ${details.delta.dy}");
          }
          openScanModal(context);
          // Navigator.pushNamed(
          //   context,
          //   NamedRoute.moduleScan,
          // );
        } else {
          if (kDebugMode) {
            print("panning swipe down");
          }
        }
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            child: CustomPaint(
              size: Size(
                MediaQuery.of(context).size.width,
                (MediaQuery.of(context).size.width * 0.2722222222222222)
                    .toDouble(),
              ),
              painter: RPSCustomPainter(),
            ),
            // child: CustomPaint(
            //   size: Size(
            //     MediaQuery.of(context).size.width,
            //     (MediaQuery.of(context).size.width * 0.19166666666666668)
            //         .toDouble(),
            //   ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            //   painter: RPSCustomPainter2(),
            // ),
          ),
          //
          const Padding(
            padding: EdgeInsets.only(
              bottom: 20,
              // bottom: 8,
            ),
            child: Text(
              "Swipe up to scan QR Code",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14,
                letterSpacing: 1,
              ),
            ),
          ),
          //
          Positioned(
            top: animPosition.value,
            child: const HeroIcon(
              HeroIcons.chevronDoubleUp,
              style: HeroIconStyle.solid,
              size: 24,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.004596398);
    path_0.cubicTo(
        0,
        size.height * 0.004596398,
        size.width * 0.1526631,
        size.height * 0.004596398,
        size.width * 0.2500000,
        size.height * 0.004596398);
    path_0.cubicTo(
        size.width * 0.4115917,
        size.height * 0.004596398,
        size.width * 0.3953139,
        size.height * 0.3628582,
        size.width * 0.5001722,
        size.height * 0.3628582);
    path_0.cubicTo(
        size.width * 0.6050333,
        size.height * 0.3628582,
        size.width * 0.5902778,
        size.height * 0.004596939,
        size.width * 0.7500000,
        size.height * 0.004596398);
    path_0.cubicTo(
        size.width * 0.8480639,
        size.height * 0.004596051,
        size.width,
        size.height * 0.004596398,
        size.width,
        size.height * 0.004596398);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, size.height * 0.004596398);
    path_0.close();

    // ignore: non_constant_identifier_names
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    // paint_0_fill.color = Color(0xffFF0000).withOpacity(1.0);
    paint_0_fill.color = AppColors.primary;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.006528319);
    path_0.cubicTo(
        0,
        size.height * 0.006528319,
        size.width * 0.1526631,
        size.height * 0.006528319,
        size.width * 0.2500000,
        size.height * 0.006528319);
    path_0.cubicTo(
        size.width * 0.4115917,
        size.height * 0.006528319,
        size.width * 0.3953139,
        size.height * 0.5153638,
        size.width * 0.5001722,
        size.height * 0.5153638);
    path_0.cubicTo(
        size.width * 0.6050333,
        size.height * 0.5153638,
        size.width * 0.5902778,
        size.height * 0.006529101,
        size.width * 0.7500000,
        size.height * 0.006528319);
    path_0.cubicTo(
        size.width * 0.8480639,
        size.height * 0.006527841,
        size.width,
        size.height * 0.006528319,
        size.width,
        size.height * 0.006528319);
    path_0.lineTo(size.width, size.height * 0.9959000);
    path_0.lineTo(0, size.height * 0.9959000);
    path_0.lineTo(0, size.height * 0.006528319);
    path_0.close();

    // ignore: non_constant_identifier_names
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = AppColors.primary;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
