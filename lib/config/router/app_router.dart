import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lupe/config/config.dart';
import 'package:lupe/domain/domain.dart';

import 'package:lupe/ui/pages/pages.dart';

abstract class AppRouter 
{
  static final GlobalKey<NavigatorState> _rootNavigationKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _rootNavigationHome = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final GlobalKey<NavigatorState> _rootNavigationProfile = GlobalKey<NavigatorState>(debugLabel: 'shellProfile');
  
  static GoRouter router(String initialLocation) => GoRouter(
    navigatorKey: _rootNavigationKey,
    initialLocation: initialLocation,
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
                routes: <RouteBase>
                [
                  
                  GoRoute(
                    path: AppRoutePaths.tripDetails,
                    name: AppRouteNames.tripDetails,
                    builder: (BuildContext context, GoRouterState state) 
                    {                      
                      return TripDetailsPage(
                        key: state.pageKey,
                        trip: state.extra as Trip,
                      );
                    },
                  ),

                ],
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _rootNavigationProfile,
            routes: <RouteBase>
            [
              GoRoute(
                path: AppRoutePaths.profile,
                name: AppRouteNames.profile,
                builder: (BuildContext context, GoRouterState state) => ProfilePage(key: state.pageKey),
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

  static Future<String> getInitialLocation() async
  {
    String lupeUserJson = await AuthSecureStorage.readData(AuthSecureStorage.lupeUser);

    return (lupeUserJson.isEmpty) 
    ? AppRoutePaths.login
    : AppRoutePaths.home;
  } 
}

