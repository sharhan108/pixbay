import 'package:flutter/material.dart';

class ResponsiveGridView extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const ResponsiveGridView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int columns = _calculateColumns(constraints.maxWidth);
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns, childAspectRatio: 1),
          itemBuilder: itemBuilder,
          itemCount: itemCount,
        );
      },
    );
  }

  int _calculateColumns(double width) {
    if (width >= 1600) {
      return 6;
    } else if (width >= 1200) {
      return 5;
    } else {
      if (width >= 800) {
        return 4;
      } else if (width >= 600) {
        return 3;
      } else {
        return 2;
      }
    }
  }
}
