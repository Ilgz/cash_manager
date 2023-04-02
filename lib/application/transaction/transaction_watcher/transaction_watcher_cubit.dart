import 'package:bloc/bloc.dart';
import 'package:cash_manager/domain/transaction/expense.dart';
import 'package:cash_manager/domain/transaction/i_transaction_repository.dart';
import 'package:cash_manager/domain/transaction/income.dart';
import 'package:cash_manager/domain/transaction/transaction_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'transaction_watcher_cubit.freezed.dart';

part 'transaction_watcher_state.dart';

@injectable
class TransactionWatcherCubit extends Cubit<TransactionWatcherState> {
  final ITransactionRepository _transactionRepository;

  TransactionWatcherCubit(this._transactionRepository)
      : super(const TransactionWatcherState.initial());

  void getTransactionData() async {
    emit(const TransactionWatcherState.loadInProgress());
    final expenseList = await _transactionRepository.getExpenses();
    final incomeList = await _transactionRepository.getIncomes();
    emit(expenseList.fold((f) => TransactionWatcherState.loadFailure(f),
        (expenses) {
      return incomeList.fold((f) => TransactionWatcherState.loadFailure(f),
          (incomes) {
        List<Either<Expense, Income>> transactions = [];
        for (var expense in expenses) {
          transactions.add(left(expense));
        }
        for (var income in incomes) {
          transactions.add(right(income));
        }
        return TransactionWatcherState.loadSuccess(transactions);
      });
    }));
  }
}
