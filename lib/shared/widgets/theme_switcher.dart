import 'package:flutter/material.dart';
import 'package:ems/shared/widgets/nitro/nitro_switcher.dart';

class LightDarkSelector extends StatefulWidget {
  const LightDarkSelector({super.key});

  @override
  _LightDarkSelectorState createState() => _LightDarkSelectorState();
}

class _LightDarkSelectorState extends State<LightDarkSelector> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return NitroSwitcher(
      isActive: isDarkMode,
      onToggle: () {
        setState(() {
          isDarkMode = !isDarkMode;
        });
      },
      leftText: "Light",
      rightText: "Dark",
    );
  }
}
