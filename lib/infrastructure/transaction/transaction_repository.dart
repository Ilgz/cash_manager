import 'dart:math';

import 'package:cash_manager/domain/transaction/expense.dart';
import 'package:cash_manager/domain/transaction/i_transaction_repository.dart';
import 'package:cash_manager/domain/transaction/income.dart';
import 'package:cash_manager/domain/transaction/transaction_failure.dart';
import 'package:cash_manager/infrastructure/transaction/expense_dto.dart';
import 'package:cash_manager/infrastructure/transaction/income_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: ITransactionRepository)
class TransactionRepository implements ITransactionRepository{
  final Box<ExpenseDto> _expenseBox;
  final  Box<IncomeDto> _incomeBox;
  TransactionRepository(@Named("expense") this._expenseBox,@Named("income") this._incomeBox);

  @override
  Future<Either<TransactionFailure, Unit>> createExpense(Expense expense)async {
    try{
      await _expenseBox.add(ExpenseDto.fromDomain(expense));
      return right(unit);
    }on HiveError catch (e){
       return left(const TransactionFailure.unexpected());
    }

  }

  @override
  Future<Either<TransactionFailure, Unit>> createIncome(Income income)async {
    try{
      await _incomeBox.add(IncomeDto.fromDomain(income));
      return right(unit);
    }on HiveError catch (e){
      return left(const TransactionFailure.unexpected());
    }
  }

  @override
  Future<Either<TransactionFailure, Unit>> deleteExpense(Expense expense) async{
    try {
      final expenseList = _expenseBox.values.toList();
      final index = expenseList.indexWhere((e) => e == ExpenseDto.fromDomain(expense));
      if (index == -1) {
        return left(const TransactionFailure.unexpected());
      }
      await _expenseBox.deleteAt(index);
      return right(unit);
    } on HiveError {
      return left(const TransactionFailure.unexpected());
    }
  }

  @override
  Future<Either<TransactionFailure, Unit>> deleteIncome(Income income) async{
    try {
      final incomeList = _incomeBox.values.toList();
      final index = incomeList.indexWhere((e) => e == IncomeDto.fromDomain(income));
      if (index == -1) {
        return left(const TransactionFailure.unexpected());
      }
      await _incomeBox.deleteAt(index);
      return right(unit);
    } on HiveError {
      return left(const TransactionFailure.unexpected());
    }
  }

  @override
  Future<Either<TransactionFailure, List<Expense>>> getExpenses()async {
    final expenses=_expenseBox.values.toList().map((e) => e.toDomain()).toList();
   return right(expenses);
  }

  @override
  Future<Either<TransactionFailure, List<Income>>> getIncomes() async{
    final incomes=_incomeBox.values.toList().map((e) => e.toDomain()).toList();
    return right(incomes);
  }

  @override
  Future<Either<TransactionFailure, Unit>> updateExpense(Expense oldExpense,Expense newExpense) async{
    try {
      final expenseList = _expenseBox.values.toList();
      final index = expenseList.indexWhere((expense) => expense == ExpenseDto.fromDomain(oldExpense));
      if (index == -1) {
        return left(const TransactionFailure.unexpected());
      }
      await _expenseBox.putAt(index, ExpenseDto.fromDomain(newExpense));
      return right(unit);
    } on HiveError {
      return left(const TransactionFailure.unexpected());
    }
  }

  @override
  Future<Either<TransactionFailure, Unit>> updateIncome(Income oldIncome,Income newIncome) async{
    try {
      final incomeList = _incomeBox.values.toList();
      final index = incomeList.indexWhere((income) => income == IncomeDto.fromDomain(oldIncome));
      if (index == -1) {
        return left(const TransactionFailure.unexpected());
      }
      await _incomeBox.putAt(index, IncomeDto.fromDomain(newIncome));
      return right(unit);
    } on HiveError {
      return left(const TransactionFailure.unexpected());
    }
  }


}