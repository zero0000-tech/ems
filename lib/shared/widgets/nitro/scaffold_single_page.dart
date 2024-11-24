import 'package:flutter/material.dart';

class NitroScaffoldSinglePage extends StatelessWidget {
  final int infotainmentFlex;
  final Widget infotainment;
  final int childFlex;
  final Widget child;
  const NitroScaffoldSinglePage({
    super.key,
    this.infotainmentFlex = 5,
    this.infotainment = const SizedBox.shrink(),
    this.childFlex = 7,
    this.child = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(224, 236, 251, 1),
      body: Row(
        children: [
          Expanded(
            flex: infotainmentFlex,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(color: Colors.white),
                  padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
                  child: infotainment,
                ),
                Positioned(
                  right: 0,
                  child: SizedBox(
                    width: 150,
                    height: MediaQuery.of(context).size.height,
                    child: CustomPaint(
                      painter: TrianglePainter(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: childFlex,
            child: child,
          ),
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color.fromRGBO(224, 236, 251, 1)
      ..style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
