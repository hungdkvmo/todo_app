import 'package:flutter/material.dart';

class HorizontalLineTitle extends StatelessWidget {
  final String title;
  final Color color;
  double? lineHeight = 1.0;
  double? lineWidth = 1.0;
  double? paddingTop = 0;
  double? paddingBottom = 0;

  HorizontalLineTitle({
    super.key,
    required this.title,
    required this.color,
    this.lineHeight,
    this.lineWidth,
    this.paddingTop,
    this.paddingBottom,
  });

  Widget _line() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = lineWidth ?? 1;
        final dashHeight = lineHeight ?? 1.0;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];
    widgets.add(Expanded(child: _line()));
    if (title != '') {
      widgets.add(Padding(
        // padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Text(
          title,
          style: TextStyle(color: color),
        ),
      ));
    } else {
      widgets.add(Container(width: 2.0));
    }
    widgets.add(Expanded(child: _line()));
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0.0, paddingTop ?? 0.0, 0.0, paddingBottom ?? 0.0),
      child: Row(
        children: widgets,
      ),
    );
  }
}
