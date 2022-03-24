import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/models/header_item.dart';
import 'package:my_portfolio/provider/home.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:my_portfolio/utils/globals.dart';
import 'package:my_portfolio/utils/screen_helper.dart';
import 'package:my_portfolio/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "A ",
                  style: GoogleFonts.josefinSans(
                    color: Colors.white,
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                TextSpan(
                  text: "Dev",
                  style: GoogleFonts.josefinSans(
                    color: kPrimaryColor,
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  const HeaderRow({Key? key}) : super(key: key);

  static List<NameOnTap> get headerItems => [
        NameOnTap(
          title: "Home",
          iconData: Icons.home,
          onTap: () {},
        ),
        NameOnTap(title: "About", onTap: () {}, iconData: Icons.info),
        NameOnTap(title: "Services", onTap: () {}, iconData: Icons.school),
        NameOnTap(title: "Portfolio", onTap: () {}, iconData: Icons.work),
        NameOnTap(title: "Contact", onTap: () {}, iconData: Icons.contact_mail),
        NameOnTap(
            title: "Blogs",
            onTap: () {
              Utilty.openUrl(AppConstants.mediumUrl);
            },
            iconData: Icons.article),
      ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: const [
        Condition.largerThan(name: MOBILE),
      ],
      child: Consumer(
        builder: (context, ref, child) {
          return Row(
            children: headerItems
                .map(
                  (item) => MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      margin: const EdgeInsets.only(right: 30.0),
                      child: GestureDetector(
                        onTap: () {
                          item.onTap();
                          HomeProvider _homeProvider = ref.read(homeProvider);
                          _homeProvider.scrollBasedOnHeader(item);
                        },
                        child: Text(
                          item.title,
                          style: TextStyle(
                            color: item.title == "Blogs"
                                ? kPrimaryColor
                                : Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: buildHeader(context),
      mobile: buildMobileHeader(),
      tablet: buildHeader(context),
    );
  }

  // mobile header
  Widget buildMobileHeader() {
    return SafeArea(
      child: Container(
        color: kBackgroundColor.withOpacity(0.95),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeaderLogo(),
            GestureDetector(
              onTap: () {
                Globals.scaffoldKey.currentState?.openEndDrawer();
              },
              child: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 28.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Lets plan for mobile and smaller width screens
  Widget buildHeader(BuildContext context) {
    return Container(
      color: kBackgroundColor.withOpacity(0.95),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenHelper.isDesktop(context) ? 24 : 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            HeaderLogo(),
            HeaderRow(),
          ],
        ),
      ),
    );
  }
}
