import 'package:cash_manager/application/%20expense/expense_form/expense_form_cubit.dart';
import 'package:cash_manager/application/income/income_form/income_form_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class TransactionNameWidget extends StatelessWidget {
  const TransactionNameWidget({
    super.key,
    required this.state, required this.controller, required this.onChanged,
  });
  final TextEditingController controller;
  final Either<ExpenseFormState,IncomeFormState> state;
  final Function(String value) onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          (!state.fold((expenseState) => expenseState.showErrorMessages, (incomeState) => incomeState.showErrorMessages) ||
              state.fold((expenseState) => expenseState.expense.expenseName.value.isRight(), (incomeState) => incomeState.income.incomeName.value.isRight()))
              ? state.fold((expenseState) => "Expense Name", (incomeState) => "Income Name")
              : state.fold((expenseState) => expenseState.expense.expenseName.value, (incomeState) => incomeState.income.incomeName.value).fold(
                  (f) => f.maybeMap(
                  empty: (_) => 'Empty value',
                  exceedingLength: (_) => 'Exceeding length 50 symbols',
                  orElse: () => ""),
                  (_) => ""),
          style: TextStyle(
              fontSize: 12,
              color: (!state.fold((expenseState) => expenseState.showErrorMessages, (incomeState) => incomeState.showErrorMessages) ||
                  state.fold((expenseState) => expenseState.expense.expenseName, (incomeState) => incomeState.income.incomeName).value.isRight())
                  ? Colors.grey[800]
                  : Colors.red),
        ),
        SizedBox(height: 4),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(
                  color: (!state.fold((expenseState) => expenseState.showErrorMessages, (incomeState) => incomeState.showErrorMessages) ||
                      state.fold((expenseState) => expenseState.expense.expenseName, (incomeState) => incomeState.income.incomeName).value.isRight())
                      ? Colors.grey[500]!
                      : Colors.red),
              borderRadius: BorderRadius.circular(8)),
          child: TextField(
            controller: controller,
            style: Theme.of(context).textTheme.bodyText1,
            cursorColor: Theme.of(context).primaryColor,
            decoration: const InputDecoration(
                hintText: "Expense Name",
                border: InputBorder.none,
                isDense: true),
            inputFormatters: [
              LengthLimitingTextInputFormatter(50),
            ],
            onChanged: (value) =>onChanged(value)
                ,
          ),
        ),
      ],
    );
  }
}