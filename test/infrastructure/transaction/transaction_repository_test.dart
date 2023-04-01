import 'package:cash_manager/domain/transaction/expense.dart';
import 'package:cash_manager/domain/transaction/income.dart';
import 'package:cash_manager/domain/transaction/value_objects.dart';
import 'package:cash_manager/infrastructure/transaction/expense_dto.dart';
import 'package:cash_manager/infrastructure/transaction/income_dto.dart';
import 'package:cash_manager/infrastructure/transaction/transaction_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_test/hive_test.dart';
import '../../fixtures/faker.dart';

void main() async {
  late Box<ExpenseDto> expenseBox;
  late Box<IncomeDto> incomeBox;
  late TransactionRepository transactionRepository;
  late Expense expense;
  late Income income;
  setUp(() async {
    await setUpTestHive();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(ExpenseDtoAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(IncomeDtoAdapter());
    }
    expenseBox = await Hive.openBox("expense");
    incomeBox = await Hive.openBox("income");
    transactionRepository = TransactionRepository(expenseBox, incomeBox);
    expense = Expense.empty().copyWith(
        expenseName: ExpenseName(getRandomName()),
        amount: Amount(getRandomDouble()));
    income = Income.empty().copyWith(
        incomeName: IncomeName(getRandomName()),
        amount: Amount(getRandomDouble()));
    await transactionRepository.createExpense(expense);
    await transactionRepository.createIncome(income);
  });
  group("GetExpenses", () {
    test(
      "should return a list of expenses when the response code is 200 (success)",
      () async {
        final expenseList = await transactionRepository.getExpenses();
        final value = expenseList.fold(
            (f) => false,
            (expenses) => expenses
                .where((project) => !project.failureOption.isNone())
                .isEmpty);
        expect(value, true);
      },
    );
  });
  group("CreateExpense", () {
    test(
      "should perform a POST request to the local database to create the expense with the given name",
      () async {
        final value = await transactionRepository.createExpense(Expense.empty()
            .copyWith(
                expenseName: ExpenseName(getRandomName()),
                amount: Amount(getRandomDouble())));
        expect(value.isRight(), true);
      },
    );
  });
  group("UpdateExpense", () {
    test(
      "should perform a PUT request to the database to update the expense with the given instance",
      () async {
        final value = await transactionRepository.updateExpense(
            expense,
            Expense.empty().copyWith(
                expenseName: ExpenseName(getRandomName()),
                amount: Amount(getRandomDouble())));
        expect(value.isRight(), true);
      },
    );
  });
  group("DeleteProject", () {
    test(
      "should perform a DELETE request to the database to delete the project with the given instance",
      () async {
        final value = await transactionRepository.deleteExpense(expense);
        expect(value.isRight(), true);
      },
    );
  });
  group("GetIncomes", () {
    test(
      "should return a list of incomes when the response code is 200 (success)",
      () async {
        final incomeList = await transactionRepository.getIncomes();
        final value = incomeList.fold(
            (f) => false,
            (incomes) => incomes
                .where((income) => !income.failureOption.isNone())
                .isEmpty);
        expect(value, true);
      },
    );
  });
  group("CreateIncome", () {
    test(
      "should perform a POST request to the local database to create the income with the given instance",
      () async {
        final value = await transactionRepository.createIncome(Income.empty()
            .copyWith(
                incomeName: IncomeName(getRandomName()),
                amount: Amount(getRandomDouble())));
        expect(value.isRight(), true);
      },
    );
  });
  group("UpdateIncome", () {
    test(
      "should perform a PUT request to the database to update the income with the given instance",
      () async {
        final value = await transactionRepository.updateIncome(
            income,
            Income.empty().copyWith(
                incomeName: IncomeName(getRandomName()),
                amount: Amount(getRandomDouble())));
        expect(value.isRight(), true);
      },
    );
  });
  group("DeleteIncome", () {
    test(
      "should perform a DELETE request to the database to delete the income with the given instance",
      () async {
        final value = await transactionRepository.deleteIncome(income);
        expect(value.isRight(), true);
      },
    );
  });
}
