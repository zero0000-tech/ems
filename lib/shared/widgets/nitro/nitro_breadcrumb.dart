import 'package:flutter/material.dart';

class NitroBreadcrumb extends StatelessWidget {
  final List<NitroBreadcrumbItem> naviList;
  final Color activeColor;
  final Color passiveColor;
  final Color separatorColor;
  final double fontSize;
  final BoxDecoration containerStyle;

  const NitroBreadcrumb({
    super.key,
    required this.naviList,
    this.activeColor = const Color.fromRGBO(54, 100, 194, 1),
    this.passiveColor = const Color.fromRGBO(126, 138, 151, 1),
    this.separatorColor = const Color.fromRGBO(200, 200, 200, 1),
    this.fontSize = 15,
    this.containerStyle = const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: Colors.white,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: containerStyle,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: List.generate(
          naviList.length * 2 - 1,
          (index) {
            if (index.isOdd) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "/",
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.normal,
                    color: separatorColor,
                  ),
                ),
              );
            } else {
              final elem = naviList[index ~/ 2];
              final isLastElement = (index ~/ 2) == naviList.length - 1;

              return ElevatedButton(
                onPressed: elem.onTap ?? () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: const EdgeInsets.all(0),
                  minimumSize: Size(fontSize * 2, fontSize * 1.5),
                  backgroundColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  alignment: Alignment.center,
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: Text(
                  elem.title,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: isLastElement ? FontWeight.bold : FontWeight.normal,
                    color: isLastElement ? activeColor : passiveColor,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class NitroBreadcrumbItem {
  final String title;
  final VoidCallback? onTap;
  const NitroBreadcrumbItem({
    required this.title,
    this.onTap,
  });
}
