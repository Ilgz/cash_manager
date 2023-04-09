import 'dart:math';

import 'package:cash_manager/application/transaction/transaction_watcher/transaction_watcher_cubit.dart';
import 'package:cash_manager/domain/transaction/expense/expense.dart';
import 'package:cash_manager/domain/transaction/income/income.dart';
import 'package:cash_manager/presentation/core/constants.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomeExpenseChart extends StatelessWidget {
  IncomeExpenseChart({Key? key}) : super(key: key);
  final List<List<int>> chartData = List.generate(12, (index) => [60, 15]);
  @override
  Widget build(BuildContext context) {
    return Card(elevation: 12, child: Column(children: [
      const SizedBox(height: 16,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for(int i = 0; i < chartMonths.length; i++)...[
            SizedBox(width: 22,height: 60,
                child: Align(alignment: Alignment.bottomCenter, child: Candle(
                  isIncome: false, monthIndex: i,)))
          ]
        ],
      ),
      Container(color: Colors.grey[400], width: double.infinity, height: 1,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for(int i = 0; i < chartMonths.length; i++)...[
            SizedBox(width: 22,height: 60,
                child: Align(alignment: Alignment.topCenter, child: Candle(
                  isIncome: true, monthIndex: i,)))
          ]
        ],
      ),
      const SizedBox(height: 16,),
      SizedBox(height: 30,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ...chartMonths.map((value) => Container(
            width: 22,
            height: 14,
              child: FittedBox(fit: BoxFit.fitHeight,
              child: Text(value, style: const TextStyle( color: Colors
                  .grey),),
            ),
          )),
        ],),)
    ],),);
  }
}

class Candle extends StatelessWidget {
  const Candle({Key? key, required this.isIncome, required this.monthIndex})
      : super(key: key);
  final bool isIncome;
  final int monthIndex;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionWatcherCubit, TransactionWatcherState>(
      builder: (context, state) {
        return state.maybeMap(loadSuccess: (state) {
          final totals = _calculateIncomeExpenseTotals(state.transactionData);
          final height = _calculateHeight(
            total: isIncome ? totals['income']! : totals['expense']!,
          );
          return Container(
            width: 6,
            height: height==0?Random().nextInt(45)+15:height,
            decoration: BoxDecoration(
                color: getBarColor(height,isIncome),
                borderRadius: !isIncome
                    ? const BorderRadius.only(
                    topLeft: Radius.circular(10), topRight: Radius.circular(10))
                    : const BorderRadius.only(bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),);
        }, orElse: () => const SizedBox());
      },
    );
  }
  Color getBarColor(double height,bool isIncome){
    late Color color;
    if(height==0){
      if(isIncome){
        color= Colors.grey[400]!;
      }else{
        color= Colors.grey[700]!;
      }
    }else{
      if(isIncome){
        color=const Color(0xff08b1e2);
      }else{
    color=const Color(0xff01359a);
      }
    }
    return color;
  }
  Map<String, double> _calculateIncomeExpenseTotals(
      List<Either<Expense, Income>> transactionData) {
    double totalIncome = 0;
    double totalExpense = 0;

    for (var transaction in transactionData) {
      transaction.fold(
            (expense) {
          if (expense.date.month == (monthIndex + 1)) {
            totalExpense += expense.amount.getOrCrash();
          }
        },
            (income) {
          if (income.date.month == (monthIndex + 1)) {
            totalIncome += income.amount.getOrCrash();
          }
        },
      );
    }

    return {'income': totalIncome, 'expense': totalExpense};
  }

  double _calculateHeight({required double total}) {
    return total >= 5000 ? 60 : total * 0.012;
  }
}


