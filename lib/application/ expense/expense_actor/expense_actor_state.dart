part of 'expense_actor_cubit.dart';

@freezed
class ExpenseActorState with _$ExpenseActorState {
  const factory ExpenseActorState.initial() = _Initial;
  const factory ExpenseActorState.createExpenseSuccess() = _CreateExpenseSuccess;
  const factory ExpenseActorState.createExpenseFail(TransactionFailure transactionFailure) = _CreateExpenseFail;
  const factory ExpenseActorState.updateExpenseSuccess() = _UpdateExpenseSuccess;
  const factory ExpenseActorState.updateExpenseFail(TransactionFailure transactionFailure) = _UpdateExpenseFail;
  const factory ExpenseActorState.deleteExpenseSuccess() = _DeleteExpenseSuccess;
  const factory ExpenseActorState.deleteExpenseFail(TransactionFailure transactionFailure) = _DeleteExpenseFail;
}
