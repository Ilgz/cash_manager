import 'package:bloc/bloc.dart';
import 'package:cash_manager/domain/transaction/expense.dart';
import 'package:cash_manager/domain/transaction/i_transaction_repository.dart';
import 'package:cash_manager/domain/transaction/transaction_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'expense_actor_state.dart';
part 'expense_actor_cubit.freezed.dart';
@injectable
class ExpenseActorCubit extends Cubit<ExpenseActorState> {
  final ITransactionRepository _transactionRepository;
  ExpenseActorCubit(this._transactionRepository) : super(const ExpenseActorState.initial());
  Future<void> createExpense(Expense expense)async{
    final value=await _transactionRepository.createExpense(expense);
    emit(value.fold((f) => ExpenseActorState.createExpenseFail(f), (_) => const ExpenseActorState.createExpenseSuccess()));
  }
  Future<void> updateExpense(Expense oldExpense,Expense newExpense)async{
    final value=await _transactionRepository.updateExpense(oldExpense, newExpense);
    emit(value.fold((f) => ExpenseActorState.updateExpenseFail(f), (_) => const ExpenseActorState.updateExpenseSuccess()));
  }
  Future<void> deleteExpense(Expense expense)async{
    final value=await _transactionRepository.deleteExpense(expense);
    emit(value.fold((f) => ExpenseActorState.deleteExpenseFail(f), (_) => const ExpenseActorState.deleteExpenseSuccess()));
  }
}
