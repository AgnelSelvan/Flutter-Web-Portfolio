import 'package:flutter/material.dart';

class NameOnTap {
  final String title;
  final IconData? iconData;
  final VoidCallback onTap;

  NameOnTap({
    required this.title,
    required this.onTap,
    this.iconData,
  });
}
