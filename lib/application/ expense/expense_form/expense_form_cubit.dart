import 'package:cash_manager/domain/transaction/expense.dart';
import 'package:cash_manager/domain/transaction/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'expense_form_cubit.freezed.dart';

part 'expense_form_state.dart';
@injectable
class ExpenseFormCubit extends Cubit<ExpenseFormState> {
  ExpenseFormCubit() : super(ExpenseFormState.initial());

  void amountChanged(String amount) {
    emit(state.copyWith(
        expense: state.expense.copyWith(amount: Amount(double.tryParse(amount)??0)),
        authFailureSuccessOption: none()));
  }

  void nameChanged(String expenseName) {
    emit(state.copyWith(
        expense: state.expense.copyWith(expenseName: ExpenseName(expenseName)),
        authFailureSuccessOption: none()));
  }

  void categoryChanged(int index) {
    emit(state.copyWith(
        expense: state.expense.copyWith(category: index),
        authFailureSuccessOption: none()));
  }

  addExpense() async {
    if (state.expense.failureOption.isNone()) {
      emit(state.copyWith(authFailureSuccessOption: some(unit)));
    }
    emit(state.copyWith(showErrorMessages: true));
  }
}
