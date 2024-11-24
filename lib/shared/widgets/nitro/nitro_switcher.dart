import 'package:flutter/material.dart';

class NitroSwitcher extends StatelessWidget {
  final bool isActive;
  final VoidCallback onToggle;
  final String leftText;
  final String rightText;
  final double width;
  final double height;
  final double activeWidth;
  final double activeHeight;

  const NitroSwitcher({
    super.key,
    required this.isActive,
    required this.onToggle,
    required this.leftText,
    required this.rightText,
    this.width = 150,
    this.height = 50,
    this.activeWidth = 65,
    this.activeHeight = 37,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromRGBO(222, 225, 237, 1),
            width: 1,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              left: isActive ? width * 0.52 : 5,
              top: ((height - activeHeight) / 2) - 2.5,
              child: Container(
                alignment: Alignment.center,
                width: activeWidth,
                height: activeHeight,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(233, 239, 246, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const SizedBox.shrink(),
              ),
            ),
            Positioned(
              left: width * 0.13,
              child: Text(
                leftText,
                style: const TextStyle(
                  color: Color.fromRGBO(64, 66, 68, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              right: width * 0.13,
              child: Text(
                rightText,
                style: const TextStyle(
                  color: Color.fromRGBO(64, 66, 68, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
