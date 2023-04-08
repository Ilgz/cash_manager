import 'package:cash_manager/application/expense/expense_form/expense_form_cubit.dart';
import 'package:cash_manager/application/income/income_form/income_form_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AmountTextField extends StatelessWidget {
  const AmountTextField({
    super.key,
    required this.state,
    required this.controller, required this.onChanged,
  });

  final Either<ExpenseFormState,IncomeFormState> state;
  final TextEditingController controller;
  final Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          (!state.fold((expenseState) => expenseState.showErrorMessages, (incomeState) => incomeState.showErrorMessages) ||
              state.fold((expenseState) => expenseState.expense.amount.value.isRight(), (incomeState) => incomeState.income.amount.value.isRight()))
              ? "Amount"
              : state.fold((expenseState) => expenseState.expense.amount.value, (incomeState) => incomeState.income.amount.value).fold(
                  (f) => f.maybeMap(
                  empty: (_) => 'Empty value',
                      isLessThanZero: (_) => 'Must be greater than zero',
                  orElse: () => ""),
                  (_) => ""),
          style: TextStyle(
              fontSize: 12,
              color: (!state.fold((expenseState) => expenseState.showErrorMessages, (incomeState) => incomeState.showErrorMessages) ||
                  state.fold((expenseState) => expenseState.expense.amount, (incomeState) => incomeState.income.amount).value.isRight())
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
                      state.fold((expenseState) => expenseState.expense.amount, (incomeState) => incomeState.income.amount).value.isRight())
                      ? Colors.grey[500]!
                      : Colors.red),
              borderRadius: BorderRadius.circular(8)),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Text("\$",                style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(width: 10,),
                VerticalDivider(width:1,indent: 5,endIndent: 5,color: Colors.grey,),
                SizedBox(width: 10,),
                Expanded(
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly                  ],
                    style: Theme.of(context).textTheme.bodyText1,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: const InputDecoration(
                        hintText: "Amount", border: InputBorder.none, isDense: true),
                      onChanged: (value) =>onChanged(value)

                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}