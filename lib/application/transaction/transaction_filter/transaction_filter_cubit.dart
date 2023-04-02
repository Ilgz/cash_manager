import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cash_manager/domain/transaction/expense.dart';
import 'package:cash_manager/domain/transaction/income.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'transaction_filter_state.dart';
part 'transaction_filter_cubit.freezed.dart';
@injectable
class TransactionFilterCubit extends Cubit<TransactionFilterState> {
  TransactionFilterCubit() : super( TransactionFilterState.initial());
  void monthIndexChanged(int monthIndex,List<Either<Expense,Income>> transactions){
    emit(state.copyWith(monthIndex: monthIndex));
    updateTransactions(transactions);
  }
  void updateTransactions(List<Either<Expense,Income>> transactions){
    var expenses=transactions.where((transaction) => transaction.fold((expense) => expense.date.month==(state.monthIndex+1), (income) => income.date.month==(state.monthIndex+1))).toList();
    expenses
        .sort((a, b) {
          return a.fold((foldedA) {
            return  foldedA.date.compareTo(b.fold((foldedB) => foldedB.date, (foldedB) => foldedB.date));
          }, (foldedB) {
            return  foldedB.date.compareTo(a.fold((foldedA) => foldedA.date, (foldedA) => foldedA.date));
          });
         });
    emit(state.copyWith(transactions: expenses));
  }
}
