import 'package:flutter/material.dart';
import 'package:ems/shared/widgets/nitro/nitro_screensize.dart';

enum NitroFlex {
  none,
  flex1,
  flex2,
  flex3,
  flex4,
  flex5,
  flex6,
  flex7,
  flex8,
  flex9,
  flex10,
  flex11,
  flex12,
}

extension NitroFlexExtension on NitroFlex {
  int get flexValue {
    switch (this) {
      case NitroFlex.flex1:
        return 1;
      case NitroFlex.flex2:
        return 2;
      case NitroFlex.flex3:
        return 3;
      case NitroFlex.flex4:
        return 4;
      case NitroFlex.flex5:
        return 5;
      case NitroFlex.flex6:
        return 6;
      case NitroFlex.flex7:
        return 7;
      case NitroFlex.flex8:
        return 8;
      case NitroFlex.flex9:
        return 9;
      case NitroFlex.flex10:
        return 10;
      case NitroFlex.flex11:
        return 11;
      case NitroFlex.flex12:
        return 12;
      case NitroFlex.none:
      default:
        return 0;
    }
  }
}

class NitroRow extends StatefulWidget {
  final List<NitroRowContainer> children;
  final double gutter;
  const NitroRow({
    super.key,
    required this.children,
    this.gutter = 0,
  });

  @override
  _NitroRowState createState() => _NitroRowState();
}

class _NitroRowState extends State<NitroRow> {
  static const int rowColLimitTotal = 12;

  int _getColumnSpanValue(NitroRowContainer container, NitroScreenCategory category) {
    switch (category) {
      case NitroScreenCategory.xtraSmall:
        return container.xtraSmallCol.flexValue;
      case NitroScreenCategory.small:
        return container.smallCol.flexValue;
      case NitroScreenCategory.medium:
        return container.normalCol.flexValue;
      case NitroScreenCategory.large:
        return container.largeCol.flexValue;
      case NitroScreenCategory.extraLarge:
        return container.xtraLargeCol.flexValue;
      default:
        return container.normalCol.flexValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenCategory = NitroScreenSize.getCategory(context);
    int rowColTempTotal = 0;
    List<Row> rowContainer = [];
    List<Widget> rowTempContainer = [];

    for (var i = 0; i < widget.children.length; i++) {
      var element = widget.children[i];
      int span = _getColumnSpanValue(element, screenCategory);

      // Skip widgets with a span of 0 (none)
      if (span == 0) continue;

      if (rowColTempTotal + span > rowColLimitTotal) {
        // If the row isn't complete, add an empty spacer to balance it
        if (rowColTempTotal < rowColLimitTotal) {
          rowTempContainer.add(
            Expanded(
              flex: rowColLimitTotal - rowColTempTotal,
              child: const SizedBox.shrink(),
            ),
          );
        }
        rowContainer.add(Row(children: rowTempContainer));
        rowTempContainer = [];
        rowColTempTotal = 0;
      }

      rowTempContainer.add(
        Expanded(
          flex: span,
          child: Padding(
            padding: EdgeInsets.all(widget.gutter),
            child: element.child,
          ),
        ),
      );
      rowColTempTotal += span;

      // Finalize the row if it's the last item or the row reaches the column limit
      if (i == widget.children.length - 1 || rowColTempTotal == rowColLimitTotal) {
        if (rowColTempTotal < rowColLimitTotal) {
          rowTempContainer.add(
            Expanded(
              flex: rowColLimitTotal - rowColTempTotal,
              child: const SizedBox.shrink(),
            ),
          );
        }
        rowContainer.add(Row(children: rowTempContainer));
        rowTempContainer = [];
        rowColTempTotal = 0;
      }
    }

    return Column(children: rowContainer);
  }
}

class NitroRowContainer {
  final NitroFlex xtraSmallCol;
  final NitroFlex smallCol;
  final NitroFlex normalCol;
  final NitroFlex largeCol;
  final NitroFlex xtraLargeCol;
  final Widget child;

  const NitroRowContainer({
    required this.normalCol,
    required this.child,
    this.xtraSmallCol = NitroFlex.flex12,
    this.smallCol = NitroFlex.flex12,
    this.largeCol = NitroFlex.flex12,
    this.xtraLargeCol = NitroFlex.flex12,
  });
}
