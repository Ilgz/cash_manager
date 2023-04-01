import 'package:cash_manager/domain/transaction/expense.dart';
import 'package:cash_manager/domain/transaction/i_transaction_repository.dart';
import 'package:cash_manager/domain/transaction/transaction_failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'expense_watcher_state.dart';
part 'expense_watcher_cubit.freezed.dart';
@injectable
class ExpenseWatcherCubit extends Cubit<ExpenseWatcherState> {
  final ITransactionRepository _transactionRepository;
  ExpenseWatcherCubit(this._transactionRepository) : super(const ExpenseWatcherState.initial());
  void getExpenses()async{
   emit(const ExpenseWatcherState.loadInProgress());
   final expenseList=await _transactionRepository.getExpenses();
   emit(expenseList.fold((f) => ExpenseWatcherState.loadFailure(f), (expenses) => ExpenseWatcherState.loadSuccess(expenses)));
  }
}
