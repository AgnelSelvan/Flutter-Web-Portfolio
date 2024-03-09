import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/home/components/header.dart';
import 'package:my_portfolio/core/utils/screen_helper.dart';

class CommonHeader extends StatelessWidget {
  const CommonHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenHelper.isDesktop(context) ? 24 : 16.0),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderLogo(),
          ],
        ),
      ),
    );
  }
}
