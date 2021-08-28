import 'package:flutter/material.dart';

final Color lightBackgroundColor = Color.fromRGBO(252, 252, 252, 1);
final Color darkBackgroundColor = Color.fromRGBO(51, 54, 59, 1);
final Color accentColor = Color.fromRGBO(237, 224, 101, 1);


Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}