import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NitroSidebar extends StatefulWidget {
  static const double _collapsedWidth = 80;
  static const double _expandedWidth = 250;
  final bool isExpanded;
  final String iconUrl;
  final String logoUrl;
  final List<NitroSidebarItem>? naviItem;

  const NitroSidebar({
    super.key,
    required this.iconUrl,
    required this.logoUrl,
    this.naviItem,
    this.isExpanded = false,
  });

  @override
  _NitroSidebar createState() => _NitroSidebar();
}

class _NitroSidebar extends State<NitroSidebar> {
  final ValueNotifier<String?> expandedItemNotifier = ValueNotifier<String?>(null);

  @override
  void dispose() {
    expandedItemNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.isExpanded ? NitroSidebar._expandedWidth : NitroSidebar._collapsedWidth,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Color.fromRGBO(222, 225, 237, 1),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 70,
            padding: const EdgeInsets.all(15),
            child: Image.network(
              widget.isExpanded ? widget.logoUrl : widget.iconUrl,
              width: widget.isExpanded ? 150 : 60,
              height: 60,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: ListView(
              children: widget.naviItem?.map<Widget>(
                    (elem) {
                      if (elem.isDividerLabel ?? false) {
                        if (widget.isExpanded) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(40, 30, 40, 10),
                            child: Text(
                              elem.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Color.fromRGBO(140, 102, 102, 1),
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      } else {
                        return Builder(
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              child: widget.isExpanded
                                  ? _NitroSidebarItemContainerExpand(
                                      title: elem.name,
                                      icon: elem.icon!,
                                      child: elem.child,
                                      onTap: elem.onTap,
                                      isExpandedNotifier: expandedItemNotifier,
                                      isExpanded: elem.isActive ?? false,
                                    )
                                  : _NitroSidebarItemContainer(
                                      title: elem.name,
                                      icon: elem.icon!,
                                      child: elem.child,
                                      onTap: elem.onTap,
                                      isExpandedNotifier: expandedItemNotifier,
                                      isExpanded: elem.isActive ?? false,
                                    ),
                            );
                          },
                        );
                      }
                    },
                  ).toList() ??
                  [],
            ),
          ),
        ],
      ),
    );
  }
}

class NitroSidebarItem {
  late bool? isDividerLabel;
  late bool? isActive;
  final IconData? icon;
  final String name;
  final VoidCallback onTap;
  final List<NitroSidebarItem>? child;

  NitroSidebarItem({
    this.icon,
    this.isDividerLabel = false,
    this.isActive = false,
    required this.name,
    required this.onTap,
    this.child,
  });
}

class _NitroSidebarItemContainerExpand extends StatefulWidget {
  final IconData icon;
  final String title;
  final List<NitroSidebarItem>? child;
  final VoidCallback onTap;
  final bool isExpanded;
  final ValueNotifier<String?> isExpandedNotifier;
  final int level;
  const _NitroSidebarItemContainerExpand({
    required this.icon,
    required this.title,
    required this.onTap,
    required this.isExpandedNotifier,
    this.child,
    this.level = 0,
    this.isExpanded = false,
  });

  @override
  _NitroSidebarItemContainerExpandState createState() => _NitroSidebarItemContainerExpandState();
}

class _NitroSidebarItemContainerExpandState extends State<_NitroSidebarItemContainerExpand> {
  late bool isExpanded;
  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpanded;
    widget.isExpandedNotifier.addListener(_onNotifierChange);
  }

  @override
  void dispose() {
    widget.isExpandedNotifier.removeListener(_onNotifierChange);
    super.dispose();
  }

  void _onNotifierChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            if (widget.child != null) {
              setState(() {
                isExpanded = !isExpanded;
              });
            } else {
              widget.onTap();
            }
          },
          style: widget.level == 0
              ? isExpanded
                  ? ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      fixedSize: const Size(225, 40),
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                      overlayColor: Colors.transparent,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    )
                  : ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      fixedSize: const Size(225, 40),
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                      overlayColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ).copyWith(
                      side: WidgetStateProperty.resolveWith<BorderSide?>((states) {
                        if (states.contains(WidgetState.hovered)) {
                          return const BorderSide(color: Colors.blue);
                        } else if (states.contains(WidgetState.pressed)) {
                          return const BorderSide(color: Colors.blue);
                        } else if (states.contains(WidgetState.selected)) {
                          return const BorderSide(color: Colors.blue);
                        } else if (states.contains(WidgetState.focused)) {
                          return const BorderSide(color: Colors.blue);
                        }
                        return const BorderSide(color: Colors.transparent);
                      }),
                    )
              : ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  fixedSize: const Size(225, 40),
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ).copyWith(
                  side: WidgetStateProperty.resolveWith<BorderSide?>((states) {
                    if (states.contains(WidgetState.hovered)) {
                      return const BorderSide(color: Colors.transparent);
                    } else if (states.contains(WidgetState.pressed)) {
                      return const BorderSide(color: Colors.transparent);
                    } else if (states.contains(WidgetState.selected)) {
                      return const BorderSide(color: Colors.transparent);
                    } else if (states.contains(WidgetState.focused)) {
                      return const BorderSide(color: Colors.transparent);
                    }
                    return const BorderSide(color: Colors.transparent);
                  }),
                ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        (widget.level == 0) ? widget.icon : FontAwesomeIcons.chevronRight,
                        size: 15,
                        color: (widget.level == 0)
                            ? const Color.fromRGBO(162, 170, 184, 1)
                            : (widget.isExpanded)
                                ? const Color.fromRGBO(0, 116, 255, 1)
                                : const Color.fromRGBO(162, 170, 184, 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            color: (widget.level == 0)
                                ? const Color.fromRGBO(52, 63, 83, 1)
                                : (widget.isExpanded)
                                    ? const Color.fromRGBO(0, 116, 255, 1)
                                    : const Color.fromRGBO(52, 63, 83, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                widget.child != null
                    ? Icon(
                        isExpanded ? FontAwesomeIcons.chevronUp : FontAwesomeIcons.chevronDown,
                        size: 10,
                        color: const Color.fromRGBO(162, 170, 184, 1),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
        if (isExpanded && widget.child != null)
          Padding(
            padding: const EdgeInsets.only(left: 20), // Extra padding for child items
            child: Column(
              children: widget.child!
                  .map(
                    (childItem) => _NitroSidebarItemContainerExpand(
                      icon: childItem.icon ?? FontAwesomeIcons.circle,
                      title: childItem.name,
                      onTap: childItem.onTap,
                      child: childItem.child,
                      isExpandedNotifier: ValueNotifier<String?>("false"),
                      isExpanded: childItem.isActive ?? false,
                      level: widget.level + 1,
                    ),
                  )
                  .toList(),
            ),
          ),
      ],
    );
  }
}

class _NitroSidebarItemContainer extends StatefulWidget {
  final IconData icon;
  final String title;
  final List<NitroSidebarItem>? child;
  final VoidCallback onTap;
  final bool isExpanded;
  final ValueNotifier<String?> isExpandedNotifier;
  final int level;
  const _NitroSidebarItemContainer({
    required this.icon,
    required this.title,
    required this.onTap,
    required this.isExpandedNotifier,
    this.child,
    this.level = 0,
    this.isExpanded = false,
  });

  @override
  _NitroSidebarItemContainerState createState() => _NitroSidebarItemContainerState();
}

class _NitroSidebarItemContainerState extends State<_NitroSidebarItemContainer> {
  late bool isExpanded;
  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpanded;
    widget.isExpandedNotifier.addListener(_onNotifierChange);
  }

  @override
  void dispose() {
    widget.isExpandedNotifier.removeListener(_onNotifierChange);
    super.dispose();
  }

  void _onNotifierChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (widget.child != null) {
          final RenderBox button = context.findRenderObject() as RenderBox;
          final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
          final Offset position = button.localToGlobal(Offset.zero, ancestor: overlay);

          showMenu(
            menuPadding: EdgeInsets.zero,
            context: context,
            constraints: const BoxConstraints(
              maxWidth: 250,
              minWidth: 200,
            ),
            color: const Color.fromRGBO(0, 116, 255, 1),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                left: Radius.zero,
                right: Radius.circular(5),
              ),
            ),
            position: RelativeRect.fromLTRB(
              position.dx + 70,
              position.dy,
              MediaQuery.of(context).size.width - (position.dx + button.size.width + 200),
              0,
            ),
            items: widget.child
                    ?.map<PopupMenuEntry>(
                      (elemChild) => PopupMenuItem(
                        value: elemChild.name,
                        onTap: elemChild.child != null
                            ? () {
                                _NitroSidebarItemContainer(
                                  title: elemChild.name,
                                  icon: elemChild.icon!,
                                  child: elemChild.child,
                                  onTap: elemChild.onTap,
                                  isExpandedNotifier: ValueNotifier<String?>("true"),
                                  isExpanded: elemChild.isActive ?? false,
                                );
                              }
                            : elemChild.onTap,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              elemChild.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            (elemChild.isActive ?? false)
                                ? const Icon(
                                    FontAwesomeIcons.chevronLeft,
                                    size: 15,
                                    color: Colors.white,
                                  )
                                : const SizedBox.shrink()
                          ],
                        ),
                      ),
                    )
                    .toList() ??
                [],
          );
        } else {
          widget.onTap();
        }
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        fixedSize: const Size(40, 40),
        elevation: 0,
        shadowColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        overlayColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(
            color: Colors.grey,
          ),
        ),
      ).copyWith(
        side: WidgetStateProperty.resolveWith<BorderSide?>((states) {
          if (states.contains(WidgetState.hovered)) {
            return const BorderSide(color: Colors.blue);
          } else if (states.contains(WidgetState.pressed)) {
            return const BorderSide(color: Colors.blue);
          } else if (states.contains(WidgetState.selected)) {
            return const BorderSide(color: Colors.blue);
          } else if (states.contains(WidgetState.focused)) {
            return const BorderSide(color: Colors.blue);
          }
          return BorderSide(color: (widget.isExpanded) ? const Color.fromRGBO(0, 116, 255, 1) : Colors.transparent);
        }),
      ),
      child: (widget.icon != null)
          ? Icon(
              widget.icon,
              size: 15,
              color: const Color.fromRGBO(150, 164, 192, 1),
            )
          : const SizedBox.shrink(),
    );
  }
}
