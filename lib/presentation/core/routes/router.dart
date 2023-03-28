import 'package:cash_manager/presentation/core/constants.dart';
import 'package:cash_manager/presentation/home/home_page.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final goRouter =
    GoRouter(navigatorKey: _rootNavigatorKey, initialLocation: PageRoutes.homePage, routes: [
  GoRoute(
    path: PageRoutes.homePage,
    pageBuilder: (context, state) =>  NoTransitionPage(
      child: HomePage(),
    ),
  ),

]);

void goToSignInPage(BuildContext context) => context.pushReplacement(
      PageRoutes.homePage,
    );
