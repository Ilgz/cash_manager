import 'dart:async';

import 'package:cash_manager/domain/transaction/expense.dart';
import 'package:cash_manager/domain/transaction/income.dart';
import 'package:cash_manager/infrastructure/transaction/expense_dto.dart';
import 'package:cash_manager/infrastructure/transaction/income_dto.dart';
import 'package:cash_manager/injection.dart';
import 'package:cash_manager/presentation/core/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
void main() async {
 await Hive.initFlutter();
  Hive.registerAdapter(ExpenseDtoAdapter());
  Hive.registerAdapter(IncomeDtoAdapter());
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.prod);
  runApp(const AppWidget());

}




