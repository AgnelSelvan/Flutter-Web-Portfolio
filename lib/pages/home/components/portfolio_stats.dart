import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/core/utils/screen_helper.dart';
import 'package:my_portfolio/models/stat.dart';
import 'package:responsive_framework/responsive_framework.dart';

final List<Stat> stats = [
  Stat(count: "5+", text: "Projects"),
  Stat(count: "4", text: "Awards"),
  Stat(
      count: (DateTime.now().year - 2021).toString(),
      text: "Years\nExperience"),
];

class PortfolioStats extends StatelessWidget {
  const PortfolioStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
    return Container(
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraint) {
            return Wrap(
              spacing: 20.0,
              runSpacing: 20.0,
              children: stats.map((stat) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  // Just use the helper here really
                  width: ScreenHelper.isMobile(context)
                      ? constraint.maxWidth / 2.0 - 20
                      : (constraint.maxWidth / 4.0 - 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        stat.count,
                        style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 32.0,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        stat.text,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: kCaptionColor,
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
