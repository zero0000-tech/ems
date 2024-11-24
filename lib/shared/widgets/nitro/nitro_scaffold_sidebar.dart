import 'package:flutter/material.dart';
import 'package:ems/shared/widgets/nitro/nitro_header.dart';
import 'package:ems/shared/widgets/nitro/nitro_sidebar.dart';

class NitroScaffoldSidebar extends StatefulWidget {
  final String navIcon;
  final String navLogo;
  final List<NitroSidebarItem>? navItem;
  final String? headerTitle;
  final List<Widget>? headerNav;
  final Widget body;
  final bool isExpanded;
  const NitroScaffoldSidebar({
    super.key,
    required this.navIcon,
    required this.navLogo,
    this.navItem,
    this.headerTitle,
    this.headerNav,
    this.isExpanded = false,
    required this.body,
  });

  @override
  _NitroScaffoldSidebarState createState() => _NitroScaffoldSidebarState();
}

class _NitroScaffoldSidebarState extends State<NitroScaffoldSidebar> {
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 250, 1),
      body: Row(
        children: [
          NitroSidebar(
            isExpanded: isExpanded,
            iconUrl: widget.navIcon,
            logoUrl: widget.navLogo,
            naviItem: widget.navItem,
          ),
          Expanded(
            child: Column(
              children: [
                NitroHeader(
                  isExpanded: isExpanded,
                  title: widget.headerTitle,
                  navigation: widget.headerNav,
                  onClickNavigator: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                ),
                Expanded(
                  child: widget.body,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
