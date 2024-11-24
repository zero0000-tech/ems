import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NitroHeader extends StatelessWidget {
  final String? title;
  final bool isExpanded;
  final List<Widget>? navigation;
  final VoidCallback? onClickNavigator;
  const NitroHeader({
    super.key,
    this.title,
    this.isExpanded = false,
    this.navigation,
    this.onClickNavigator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(222, 225, 237, 1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: onClickNavigator ?? () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: const Size(60, 60),
                    surfaceTintColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    alignment: Alignment.center,
                    padding: EdgeInsets.zero,
                    splashFactory: NoSplash.splashFactory,
                    overlayColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Icon(
                    isExpanded ? FontAwesomeIcons.chevronLeft : FontAwesomeIcons.arrowRightLong,
                    color: const Color.fromRGBO(0, 116, 255, 1),
                    size: 18,
                  ),
                ),
                (title != null)
                    ? Text(
                        title!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(17, 18, 31, 1),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          Expanded(
            flex: isExpanded ? 3 : 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: navigation ?? [const SizedBox.shrink()],
            ),
          ),
        ],
      ),
    );
  }
}
