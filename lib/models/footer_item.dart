import 'package:flutter/material.dart';

class FooterItem {
  final IconData iconData;
  final String title;
  final String text1;
  final String text2;
  final VoidCallback? onTap;

  FooterItem({
    this.onTap,
    required this.iconData,
    required this.title,
    required this.text1,
    required this.text2,
  });
}
