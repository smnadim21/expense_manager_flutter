import 'package:flutter/cupertino.dart';

import '../../global_import.dart';

Widget listTile(Map data) {
  return ListTile(
    leading: Card(
        elevation: 0,
        color: LocalColors.text_blue_light,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            data['icon'],
            size: 16,
            color: themeColor,
          ),
        )),
    title: Text(
      data['title'],
      style: const TextStyle(fontWeight: FontWeight.w700),
    ),
  );
}

class WIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  final double? fill;
  final FontWeight? weight;
  final Color? color;

  const WIcon(
    this.icon, {
    super.key,
    this.size,
    this.fill,
    this.weight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      String.fromCharCode(icon.codePoint),
      style: TextStyle(
        inherit: false,
        color: color,
        fontSize: size,
        fontWeight: weight,
        fontFamily: icon.fontFamily,
        package: icon.fontPackage,
      ),
    );
  }
}
