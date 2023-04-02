part of 'expense_form_cubit.dart';

@freezed
class ExpenseFormState with _$ExpenseFormState {
   factory ExpenseFormState.initial() => ExpenseFormState(expense:Expense.empty(), showErrorMessages: false, authFailureSuccessOption: none());
  const factory ExpenseFormState({required Expense expense,required bool showErrorMessages,required Option<Either<TransactionFailure,Unit>> authFailureSuccessOption})= _ExpenseFormState;
}
