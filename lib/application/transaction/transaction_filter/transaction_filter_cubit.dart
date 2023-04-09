import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cash_manager/application/transaction/transaction_watcher/transaction_watcher_cubit.dart';
import 'package:cash_manager/domain/transaction/expense/expense.dart';
import 'package:cash_manager/domain/transaction/income/income.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'transaction_filter_state.dart';
part 'transaction_filter_cubit.freezed.dart';
@injectable
class TransactionFilterCubit extends Cubit<TransactionFilterState> {
  TransactionFilterCubit() : super(TransactionFilterState.initial());

  void monthIndexChanged(int monthIndex, TransactionWatcherCubit transactionWatcherCubit) {
    emit(state.copyWith(monthIndex: monthIndex));

    List<Either<Expense, Income>> allTransactions = transactionWatcherCubit.state.maybeMap(
      loadSuccess: (state) => state.transactionData,
      orElse: () => [],
    );

    updateTransactionList(allTransactions);
  }

  void updateTransactionList(List<Either<Expense, Income>> allTransactions) {
    List<Either<Expense, Income>> filteredTransactions = _filterTransactionsByMonth(allTransactions, state.monthIndex);
    filteredTransactions.sort(_compareTransactionDates);
    emit(state.copyWith(transactions: filteredTransactions));
  }

  List<Either<Expense, Income>> _filterTransactionsByMonth(List<Either<Expense, Income>> transactions, int month) {
    return transactions.where((transaction) => transaction.fold(
          (expense) => expense.date.month == month,
          (income) => income.date.month == month,
    )).toList();
  }

  int _compareTransactionDates(Either<Expense, Income> a, Either<Expense, Income> b) {
    DateTime dateA = a.fold((expense) => expense.date, (income) => income.date);
    DateTime dateB = b.fold((expense) => expense.date, (income) => income.date);

    return dateA.compareTo(dateB);
  }
}

