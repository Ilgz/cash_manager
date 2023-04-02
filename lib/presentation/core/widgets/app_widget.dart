import 'package:cash_manager/application/expense/expense_filter/expense_filter_cubit.dart';
import 'package:cash_manager/application/expense/expense_watcher/expense_watcher_cubit.dart';
import 'package:cash_manager/injection.dart';
import 'package:cash_manager/presentation/core/routes/router.dart';
import 'package:cash_manager/presentation/core/theme.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          getIt<ExpenseWatcherCubit>()
            ..getExpenses(),
        ),

        BlocProvider(
          create: (context) => getIt<ExpenseFilterCubit>(),
        ),
      ],
      child: MaterialApp.router(
          routerConfig: goRouter,
          title: "Cash manager",
          debugShowCheckedModeBanner: false,
          darkTheme: darkTheme,
          theme: lightTheme),
    );
  }
}
