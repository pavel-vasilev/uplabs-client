import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final Widget title;

  final Widget action;

  final Axis scrollDirection;

  final int itemCount;

  final IndexedWidgetBuilder itemBuilder;

  Section({
    this.title,
    this.action,
    this.scrollDirection,
    this.itemCount,
    this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            title,
            action,
          ],
        ),
        ListView.builder(
          scrollDirection: scrollDirection,
          shrinkWrap: true,
          primary: false,
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        ),
      ],
    );
  }
}