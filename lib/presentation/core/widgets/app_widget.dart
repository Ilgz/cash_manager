import 'package:cash_manager/application/transaction/transaction_filter/transaction_filter_cubit.dart';
import 'package:cash_manager/application/transaction/transaction_watcher/transaction_watcher_cubit.dart';
import 'package:cash_manager/injection.dart';
import 'package:cash_manager/presentation/core/constants.dart';
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
          getIt<TransactionWatcherCubit>()
            ..getTransactionData(),
        ),

        BlocProvider(
          create: (context) => getIt<TransactionFilterCubit>(),
        ),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Color(0xff0039a5), // set your desired status bar color here
        ),
        child: MaterialApp.router(
            routerConfig: goRouter,
            title: "Cash manager",
            debugShowCheckedModeBanner: false,
            darkTheme: darkTheme,
            theme: lightTheme),
      ),
    );
  }
}
