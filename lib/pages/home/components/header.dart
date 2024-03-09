import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/routes/routes.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/core/utils/globals.dart';
import 'package:my_portfolio/core/utils/screen_helper.dart';
import 'package:my_portfolio/core/utils/utils.dart';
import 'package:my_portfolio/models/header_item.dart';
import 'package:my_portfolio/provider/home.dart';
import 'package:my_portfolio/provider/theme.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Container(
        padding: const EdgeInsets.all(20),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              context.goNamed(Routes.initial);
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "A ",
                    style: GoogleFonts.josefinSans(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: ref.watch(themeProvider).isDarkMode
                          ? Colors.white
                          : Colors.black,
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
    });
  }
}

class HeaderRow extends StatelessWidget {
  const HeaderRow({Key? key, required this.themeSwitch}) : super(key: key);
  final Widget themeSwitch;

  static List<NameOnTap> get headerItems => [
        NameOnTap(
          title: "Home",
          iconData: Icons.home,
          onTap: () {},
        ),
        NameOnTap(
          title: "About",
          onTap: () {},
          iconData: Icons.info,
        ),
        NameOnTap(
          title: "Services",
          onTap: () {},
          iconData: Icons.school,
        ),
        NameOnTap(
          title: "Works",
          onTap: () {},
          iconData: Icons.work,
        ),
        NameOnTap(
          title: "Contact",
          onTap: () {},
          iconData: Icons.contact_mail,
        ),
        NameOnTap(
          title: "Blogs",
          onTap: () {
            Utilty.openUrl(AppConstants.mediumUrl);
          },
          iconData: Icons.article,
        ),
        NameOnTap(
          title: "Themes",
          onTap: () {
            Utilty.openUrl(AppConstants.mediumUrl);
          },
          iconData: Icons.light_mode_outlined,
          isDarkTheme: true,
        ),
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
          return Row(children: [
            ...headerItems
                .map(
                  (item) => item.title == "Themes"
                      ? const Text("")
                      : MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            margin: const EdgeInsets.only(right: 30.0),
                            child: GestureDetector(
                              onTap: () {
                                item.onTap();
                                HomeProvider _homeProvider =
                                    ref.read(homeProvider);
                                _homeProvider.scrollBasedOnHeader(item);
                              },
                              child: Text(
                                item.title,
                                style: TextStyle(
                                  color: item.title == "Blogs"
                                      ? kPrimaryColor
                                      : null,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                )
                .toList(),
            themeSwitch
          ]);
        },
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key, required this.themeSwitch}) : super(key: key);
  final Widget themeSwitch;

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: buildHeader(context, themeSwitch),
      mobile: buildMobileHeader(context),
      tablet: buildHeader(context, themeSwitch),
    );
  }

  // mobile header
  Widget buildMobileHeader(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
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
                size: 28.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Lets plan for mobile and smaller width screens
  Widget buildHeader(BuildContext context, Widget themeSwitch) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenHelper.isDesktop(context) ? 24 : 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeaderLogo(),
            HeaderRow(
              themeSwitch: themeSwitch,
            ),
          ],
        ),
      ),
    );
  }
}
