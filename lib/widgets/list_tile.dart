import 'package:flutter/material.dart';

class ListTileView extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final VoidCallback onTap;

  const ListTileView(
      {Key? key,
      required this.leading,
      required this.onTap,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(leading: leading, title: title, onTap: onTap);
  }
}
