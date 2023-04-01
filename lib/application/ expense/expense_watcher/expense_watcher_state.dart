part of 'expense_watcher_cubit.dart';

@freezed
class ExpenseWatcherState with _$ExpenseWatcherState {
  const factory ExpenseWatcherState.initial() = _Initial;
  const factory ExpenseWatcherState.loadInProgress()=_LoadInProgress;
  const factory ExpenseWatcherState.loadSuccess(List<Expense> expenses)=_LoadSuccess;
  const factory ExpenseWatcherState.loadFailure(TransactionFailure transactionFailure)=_LoadFailure;
}
