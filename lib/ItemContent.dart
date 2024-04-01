import 'dart:ffi';

import 'package:flutter/material.dart';

class ItemContent extends StatelessWidget {
  final String item1;
  final String item2;
  final String item3;
  const ItemContent(
      {super.key,
      required this.item1,
      required this.item2,
      required this.item3});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(title: Text(item1)),
        ListTile(title: Text(item2)),
        ListTile(title: Text(item3)),
      ],
    );
  }
}
