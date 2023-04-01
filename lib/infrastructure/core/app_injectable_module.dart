// app_injectable_module.dart

import 'package:cash_manager/domain/transaction/expense.dart';
import 'package:cash_manager/domain/transaction/income.dart';
import 'package:cash_manager/infrastructure/transaction/expense_dto.dart';
import 'package:cash_manager/infrastructure/transaction/income_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@Scope(Environment.prod)
@module
abstract class AppInjectableProdModule {
  @lazySingleton
  http.Client get httpClient => http.Client();
  @preResolve
  @Named("income")
  Future<Box<IncomeDto>> get incomeBox =>
      Hive.openBox("income");
  @preResolve
  @Named("expense")
  Future<Box<ExpenseDto>> get expenseBox =>
      Hive.openBox("expense");
}
