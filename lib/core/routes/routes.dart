import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:life_from_simple_rules/screens/home.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/pages/demo/demo.dart';
import 'package:my_portfolio/pages/home/home.dart';
import 'package:my_portfolio/pages/json_to_dart/json_to_dart.dart';
import 'package:my_portfolio/pages/works/works.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sand_simulation/home.dart';

class Routes {
  static const String initial = "/";
  static const String demos = "demos";
  static const String myWorks = "works";
  static const String simulation = "simulation";
  static const String sandSimulation = "simulation/sand";
  static const String jsonToDart = "json_to_dart";
}

class RouterGenerator {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.initial,
        builder: (context, state) => const _AppResponsiveBuilder(
          child: Home(),
        ),
        routes: [
          GoRoute(
            path: Routes.demos,
            name: Routes.demos,
            builder: (context, state) =>
                const _AppResponsiveBuilder(child: DemoScreen()),
          ),
          GoRoute(
            path: Routes.myWorks,
            name: Routes.myWorks,
            builder: (context, state) =>
                const _AppResponsiveBuilder(child: MyWorksScreen()),
          ),
          GoRoute(
            path: Routes.simulation,
            name: Routes.simulation,
            builder: (context, state) =>
                const _AppResponsiveBuilder(child: ParticleScreen()),
          ),
          GoRoute(
            path: Routes.sandSimulation,
            name: Routes.sandSimulation,
            builder: (context, state) =>
                const _AppResponsiveBuilder(child: SandSimulationScreen()),
          ),
          GoRoute(
            path: Routes.jsonToDart,
            name: Routes.jsonToDart,
            builder: (context, state) =>
                const _AppResponsiveBuilder(child: JsonToDartScreen()),
          ),
        ],
      ),
    ],
  );
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.initial:
//         return _GeneratePageRoute(
//             widget: const Home(), routeName: settings.name);
//       case Routes.demos:
//         return _GeneratePageRoute(
//             widget: const DemoScreen(), routeName: settings.name);
//       case Routes.myWorks:
//         return _GeneratePageRoute(
//             widget: const MyWorksScreen(), routeName: settings.name);
//       case Routes.simulation:
//         return _GeneratePageRoute(
//             widget: const ParticleScreen(), routeName: settings.name);
//       case Routes.jsonToDart:
//         return _GeneratePageRoute(
//             widget: const JsonToDartScreen(), routeName: settings.name);
//       default:
//         return _GeneratePageRoute(
//             widget: const Home(), routeName: settings.name);
//     }
//   }
}

// class _GeneratePageRoute extends PageRouteBuilder {
//   final Widget? widget;
//   final String? routeName;
//   _GeneratePageRoute({this.widget, this.routeName})
//       : super(
//             settings: RouteSettings(name: routeName),
//             pageBuilder: (BuildContext context, Animation<double> animation,
//                 Animation<double> secondaryAnimation) {
//               return widget ?? Container();
//             },
//             transitionDuration: const Duration(milliseconds: 500),
//             transitionsBuilder: (BuildContext context,
//                 Animation<double> animation,
//                 Animation<double> secondaryAnimation,
//                 Widget child) {
//               return SlideTransition(
//                   textDirection: TextDirection.rtl,
//                   position: Tween<Offset>(
//                     begin: const Offset(1.0, 0.0),
//                     end: Offset.zero,
//                   ).animate(animation),
//                   child: ResponsiveWrapper.builder(
//                     ClampingScrollWrapper.builder(context, child),
//                     defaultScale: true,
//                     breakpoints: [
//                       const ResponsiveBreakpoint.resize(450, name: MOBILE),
//                       const ResponsiveBreakpoint.resize(800, name: TABLET),
//                       const ResponsiveBreakpoint.resize(1000, name: TABLET),
//                       const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
//                       const ResponsiveBreakpoint.resize(2460, name: "4K"),
//                     ],
//                     background: Container(
//                       color: kBackgroundColor,
//                     ),
//                   ));
//             });
// }

class _AppResponsiveBuilder extends StatelessWidget {
  final Widget child;
  const _AppResponsiveBuilder({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.builder(
      ClampingScrollWrapper.builder(context, child),
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
    );
  }
}
