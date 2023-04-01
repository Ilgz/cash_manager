import 'package:bloc/bloc.dart';
import 'package:cash_manager/domain/transaction/expense.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'expense_filter_state.dart';
part 'expense_filter_cubit.freezed.dart';
@injectable
class ExpenseFilterCubit extends Cubit<ExpenseFilterState> {
  ExpenseFilterCubit() : super(ExpenseFilterState.initial());
  void monthIndexChanged(int monthIndex){
    emit(state.copyWith(monthIndex: monthIndex));
    updateExpenses(state.expenses);
  }
  void updateExpenses(List<Expense> expenses){
    emit(state.copyWith(expenses: expenses));
  }
}
