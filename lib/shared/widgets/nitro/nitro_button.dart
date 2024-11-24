import 'package:flutter/material.dart';

class NitroButton {
  static Widget largeButton({
    required VoidCallback onPressed,
    required List<Widget> child,
    required NitroButtonStyle style,
    bool isShowBadge = false,
    String badgeString = "",
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: style.elevation,
            backgroundColor: style.backgroundColor,
            fixedSize: const Size.fromHeight(50),
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            splashFactory: NoSplash.splashFactory,
            overlayColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: style.borderColor,
              ),
              borderRadius: BorderRadius.circular(style.borderRadius),
            ),
          ),
          child: Row(
            children: child.toList(),
          ),
        ),
        isShowBadge
            ? Positioned(
                top: -5,
                right: -5,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                  decoration: BoxDecoration(
                    color: style.badgeColor,
                    borderRadius: BorderRadius.circular(5),
                    shape: BoxShape.rectangle,
                  ),
                  child: Text(
                    badgeString,
                    style: TextStyle(
                      color: style.badgeTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

class NitroButtonStyle {
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final double elevation;
  final Color badgeColor;
  final Color badgeTextColor;
  const NitroButtonStyle({
    required this.backgroundColor,
    this.borderColor = Colors.transparent,
    this.borderRadius = 0,
    this.elevation = 0,
    this.badgeColor = const Color.fromRGBO(28, 36, 48, 1),
    this.badgeTextColor = Colors.white,
  });
}
