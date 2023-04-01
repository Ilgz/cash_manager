import 'package:cash_manager/presentation/core/constants.dart';
import 'package:cash_manager/presentation/goals/goal_page.dart';
import 'package:cash_manager/presentation/transaction/expense/expense_page.dart';
import 'package:cash_manager/presentation/transaction/transaction_page.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final goRouter =
    GoRouter(navigatorKey: _rootNavigatorKey, initialLocation: PageRoutes.transactionPage, routes: [
  GoRoute(
    path: PageRoutes.transactionPage,
    pageBuilder: (context, state) =>  const NoTransitionPage(
      child: TransactionPage(),
    ),
  ),
      GoRoute(
        path: PageRoutes.goalPage,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: GoalPage(),
        ),
        routes:[
          GoRoute(
            path: PageRoutes.expensePage,
            pageBuilder: (context, state) =>   NoTransitionPage(
              child: ExpensePage(),
            ),
          ),
        ]
      ),

]);

void goToSignInPage(BuildContext context) => context.pushReplacement(
      PageRoutes.transactionPage,
    );
void goToGoalPage(BuildContext context) => context.pushReplacement(
  PageRoutes.goalPage,
);
void goToExpensePage(BuildContext context) => context.pushReplacement(
  "${PageRoutes.transactionPage}/${PageRoutes.expensePage}",
);

