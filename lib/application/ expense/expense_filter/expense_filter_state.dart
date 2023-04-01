part of 'expense_filter_cubit.dart';

@freezed
class ExpenseFilterState with _$ExpenseFilterState {
   factory ExpenseFilterState.initial() =>ExpenseFilterState(expenses: [], monthIndex: 0);
  const factory ExpenseFilterState({required List<Expense> expenses,required int monthIndex})= _ExpenseFilterState;

}
