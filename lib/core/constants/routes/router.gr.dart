// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    HomeSubRoute.name: (routeData) {
      final args = routeData.argsAs<HomeSubRouteArgs>(
          orElse: () => const HomeSubRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: HomeSubPage(key: args.key));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/'),
        RouteConfig(HomeSubRoute.name, path: '/home-sub-page')
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [HomeSubPage]
class HomeSubRoute extends PageRouteInfo<HomeSubRouteArgs> {
  HomeSubRoute({Key? key})
      : super(HomeSubRoute.name,
            path: '/home-sub-page', args: HomeSubRouteArgs(key: key));

  static const String name = 'HomeSubRoute';
}

class HomeSubRouteArgs {
  const HomeSubRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeSubRouteArgs{key: $key}';
  }
}
