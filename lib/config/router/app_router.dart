import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lupe/config/config.dart';

import 'package:lupe/ui/pages/pages.dart';

abstract class AppRouter 
{
  static final GlobalKey<NavigatorState> _rootNavigationKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _rootNavigationHome = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  
  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigationKey,
    initialLocation: AppRoutePaths.login,
    routes: <RouteBase> 
    [
      GoRoute(
        path: AppRoutePaths.login,
        name: AppRouteNames.login,
        builder: (BuildContext context, GoRouterState state) => LoginPage(key: state.pageKey),
      ),
      StatefulShellRoute.indexedStack(        
        branches: <StatefulShellBranch> 
        [
          StatefulShellBranch(
            navigatorKey: _rootNavigationHome,
            routes: <RouteBase>
            [
              GoRoute(
                path: AppRoutePaths.home,
                name: AppRouteNames.home,
                builder: (BuildContext context, GoRouterState state) => HomePage(key: state.pageKey),
                // routes: <RouteBase>
                // [
                //   GoRoute(
                //     path: 'subpage1',
                //     name: 'SubPage1',
                //     builder: (BuildContext context, GoRouterState state) => SubPage1(key: state.pageKey),
                //   ),
                // ],
              ),
            ],
          ),

        ], 
        builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) 
        {
          return MainWraper(navigationShell: navigationShell);
        },
      ),
    ]
  ); 
}

