import 'package:cash_manager/application/transaction/transaction_watcher/transaction_watcher_cubit.dart';
import 'package:cash_manager/domain/transaction/expense/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomeExpenseChart extends StatelessWidget {
  IncomeExpenseChart({Key? key}) : super(key: key);
  List<List<int>> chartData = List.generate(12, (index) => [60, 15]);
  List<String> chartMonths = [
    "Jan",
    "",
    "Mar",
    "",
    "May",
    "",
    "Jul",
    "",
    "Sep",
    "",
    "Nov",
    ""
  ];

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 12, child: Column(children: [
      const SizedBox(height: 16,),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for(int i = 0; i < chartMonths.length; i++)...[
            SizedBox(width: 22,
                child: Align(alignment: Alignment.bottomCenter, child: Candle(
                  isIncome: false, monthIndex: i,)))
          ]
        ],
      ),
      Container(color: Colors.grey[400], width: double.infinity, height: 1,),
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for(int i = 0; i < chartMonths.length; i++)...[
            SizedBox(width: 22,
                child: Align(alignment: Alignment.bottomCenter, child: Candle(
                  isIncome: true, monthIndex: i,)))
          ]
        ],
      ),
      const SizedBox(height: 16,),
      SizedBox(height: 30,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ...chartMonths.map((value) => SizedBox(width: 22,
            child: Align(alignment: Alignment.topCenter,
                child: Text(value, style: const TextStyle(fontSize: 10, color: Colors
                    .grey),)),)),
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
          late double height;
          if (isIncome) {
            double total=0;
            for (var transaction in state.transactionData) {
              transaction.fold((_) {},(income) {
                if(income.date.month==(monthIndex+1)){
                  total+=income.amount.getOrCrash();
                }
              }, );
            }
            if(total>=5000){
              height=60;
            }else{
              height=total*0.012;
            }
          } else {
            double total=0;
            for (var transaction in state.transactionData) {
              transaction.fold((expense) {
                if(expense.date.month==(monthIndex+1)){
                  total+=expense.amount.getOrCrash();
                }
              }, (_) {});
            }
            if(total>=5000){
              height=60;
            }else{
              height=total*0.012;
            }
          }
          return Container(
            width: 6,
            height: height,
            decoration: BoxDecoration(
                color: isIncome ?   const Color(0xff08b1e2):const Color(0xff01359a),
                borderRadius: !isIncome
                    ? const BorderRadius.only(
                    topLeft: Radius.circular(10), topRight: Radius.circular(10))
                    : const BorderRadius.only(bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),);
        }, orElse: () => const SizedBox());
      },
    );
  }
}

