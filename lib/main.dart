import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/pages/home/home.dart';
import 'package:my_portfolio/provider/theme.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return ThemeProvider(
        initTheme: ref.watch(themeProvider).isDarkMode
            ? MyThemes.darkTheme
            : MyThemes.lightTheme,
        child: MaterialApp(
          title: "Agnel Selvan",
          debugShowCheckedModeBanner: false,
          themeMode: ref.watch(themeProvider).themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          // themeMode: ThemeMode.system,
          // theme: ThemeData(primarySwatch: Colors.yellow),
          // darkTheme: Theme.of(context).copyWith(
          //   platform: TargetPlatform.android,
          //   scaffoldBackgroundColor: kBackgroundColor,
          //   primaryColor: kPrimaryColor,
          //   canvasColor: kBackgroundColor,
          //   textTheme: GoogleFonts.josefinSansTextTheme(),
          // ),
          builder: (context, widget) => ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget ?? Container()),
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.resize(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1000, name: TABLET),
              const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              const ResponsiveBreakpoint.resize(2460, name: "4K"),
            ],
            background: Container(
              color: kBackgroundColor,
            ),
          ),
          home: const Home(),
        ),
      );
    });
  }
}

// import 'package:flutter/material.dart';
// import 'package:my_portfolio/testing.dart';

// void main() => runApp(const MyApp());
