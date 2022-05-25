import 'package:auto_route/auto_route.dart';
import 'package:todoexample/features/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:todoexample/features/home/sub/home_sub_view.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: HomeSubPage),
  ],
)
class AppRouter extends _$AppRouter {}
