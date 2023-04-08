import 'dart:math';

import 'package:cash_manager/domain/transaction/expense/expense.dart';
import 'package:cash_manager/domain/transaction/i_transaction_repository.dart';
import 'package:cash_manager/domain/transaction/transaction_failure.dart';
import 'package:cash_manager/domain/transaction/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'expense_form_cubit.freezed.dart';

part 'expense_form_state.dart';
@injectable
class ExpenseFormCubit extends Cubit<ExpenseFormState> {
  final ITransactionRepository transactionRepository;
  ExpenseFormCubit(this.transactionRepository) : super(ExpenseFormState.initial());
  void initialize(Expense? expense){
    emit(state.copyWith(expense: expense??Expense.empty()));
  }
  void amountChanged(String amount) {
    emit(state.copyWith(
        expense: state.expense.copyWith(amount: Amount(double.tryParse(amount)??0)),
        authFailureSuccessOption: none()));
  }

  void nameChanged(String expenseName) {
    emit(state.copyWith(
        expense: state.expense.copyWith(name: TransactionName(expenseName)),
        authFailureSuccessOption: none()));
  }

  void categoryChanged(int index) {
    emit(state.copyWith(
        expense: state.expense.copyWith(category: index),
        authFailureSuccessOption: none()));
  }
  createExpense() async {
    if (state.expense.failureOption.isNone()) {
      final value=await transactionRepository.createExpense(state.expense);
      emit(state.copyWith(authFailureSuccessOption: some(value.fold((f) =>left(f), (_) => right(unit)))));
    }
    emit(state.copyWith(showErrorMessages: true));
  }
  Future<void> updateExpense(Expense oldExpense)async{
    if (state.expense.failureOption.isNone()) {
      final value=await transactionRepository.updateExpense(oldExpense,state.expense);
      emit(state.copyWith(authFailureSuccessOption: some(value.fold((f) =>left(f), (_) => right(unit)))));
    }
    emit(state.copyWith(showErrorMessages: true));
  }
  Future<void> deleteExpense(Expense expense)async{
    if (state.expense.failureOption.isNone()) {
      final value=await transactionRepository.deleteExpense(expense);
      emit(state.copyWith(authFailureSuccessOption: some(value.fold((f) =>left(f), (_) => right(unit)))));
    }
    emit(state.copyWith(showErrorMessages: true));
  }
}
