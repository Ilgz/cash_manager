import 'package:cash_manager/domain/core/transaction.dart';
import 'package:cash_manager/domain/transaction/expense/expense.dart';
import 'package:cash_manager/domain/transaction/income/income.dart';
import 'package:dartz/dartz.dart';

Tuple2<int, int> calculateExpenseIncomeTotal(
    List<Transaction> transactionData) {
  int expenseTotal = 0;
  int incomeTotal = 0;
  for (var transaction in transactionData) {
    if (transaction.isIncome) {
      incomeTotal += transaction.amount.getOrCrash().round();
    } else {
      expenseTotal += transaction.amount.getOrCrash().round();
    }
  }
  return Tuple2(expenseTotal, incomeTotal);
}

List<Transaction> convertEitherToTransactionList(
    List<Either<Expense, Income>> incomesOrExpenses) {
  List<Transaction> transactionList = [];
  for (var incomeOrExpense in incomesOrExpenses) {
    transactionList.add(incomeOrExpense.fold(
        (expense) => Transaction.fromExpense(expense),
        (income) => Transaction.fromIncome(income)));
  }
  return transactionList;
}
