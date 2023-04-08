import 'package:cash_manager/domain/transaction/expense/expense.dart';
import 'package:cash_manager/domain/transaction/income/income.dart';
import 'package:cash_manager/domain/transaction/transaction_failure.dart';
import 'package:dartz/dartz.dart';
abstract class ITransactionRepository{
  Future<Either<TransactionFailure,List<Expense>>> getExpenses();
  Future<Either<TransactionFailure,List<Income>>> getIncomes();
  Future<Either<TransactionFailure, Unit>> updateExpense(Expense oldExpense,Expense newExpense) ;
  Future<Either<TransactionFailure, Unit>> updateIncome(Income oldIncome,Income newIncome);
  Future<Either<TransactionFailure, Unit>>createExpense(Expense expense);
  Future<Either<TransactionFailure, Unit>>createIncome(Income income);
  Future<Either<TransactionFailure, Unit>>deleteExpense(Expense expense);
  Future<Either<TransactionFailure, Unit>>deleteIncome(Income income);
}