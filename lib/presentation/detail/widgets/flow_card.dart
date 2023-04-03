import 'package:cash_manager/application/transaction/transaction_watcher/transaction_watcher_cubit.dart';
import 'package:cash_manager/domain/transaction/income.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
class FlowCard extends StatelessWidget {
  const FlowCard({Key? key, required this.isInflow}) : super(key: key);
  final bool isInflow;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionWatcherCubit, TransactionWatcherState>(
  builder: (context, state) {
    return state.maybeMap(loadSuccess: (state){
      late Tuple2<bool,int> incomePercentage;
      late Tuple2<bool,int> expensePercentage;
        int currentMonthIncome=0;
        int previousMonthIncome=0;
        int currentMonthExpense=0;
        int previousMonthExpense=0;
        for(var transaction in state.transactionData){
          transaction.fold((expense){
            if(expense.date.year==DateTime.now().year&&expense.date.month==DateTime.now().month){
              currentMonthExpense+=(expense.amount.getOrCrash().toInt());
            }
            else if(expense.date.year==DateTime.now().year-(DateTime.now().month==1?1:0)&&(expense.date.month==(DateTime.now().month==1?12:DateTime.now().month))){
              previousMonthExpense+=(expense.amount.getOrCrash().toInt());
            }
          }, (income) {
            if(income.date.year==DateTime.now().year&&income.date.month==DateTime.now().month){
currentMonthIncome+=(income.amount.getOrCrash().toInt());
            }
            else if(income.date.year==DateTime.now().year-(DateTime.now().month==1?1:0)&&(income.date.month==(DateTime.now().month==1?12:DateTime.now().month))){
              previousMonthIncome+=(income.amount.getOrCrash().toInt());
            }
          });
        }
        double inflowDiff = (currentMonthIncome - previousMonthIncome).abs().toDouble();
        double inflowAvg = ((currentMonthIncome + previousMonthIncome) / 2).toDouble();
        int inflowPercentageDiff = ((inflowDiff / inflowAvg) * 100).toInt();
        bool incomeIsRising=currentMonthIncome>=previousMonthIncome;
        incomePercentage=Tuple2(incomeIsRising, inflowPercentageDiff);
      double outflowDiff = (currentMonthExpense - previousMonthExpense).abs().toDouble();
      double outflowAvg = ((currentMonthExpense + previousMonthExpense) / 2).toDouble();
      int outflowPercentageDiff = ((outflowDiff / outflowAvg) * 100).toInt();
      bool expenseIsRising=currentMonthExpense>=previousMonthExpense;
      expensePercentage=Tuple2(expenseIsRising, outflowPercentageDiff);
      return Card(child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(children: [
          CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Padding(
                padding: const   EdgeInsets.all(8.0),
                child: Icon(
                  isInflow?Icons.arrow_upward_outlined:Icons.arrow_downward_outlined,
                  color: isInflow?Colors.green:Colors.red[900],
                  size: 24,
                ),
              )),
          SizedBox(width: 8,),
          Text(isInflow?"Inflow":"Outflow",style: TextStyle(fontSize:18),),
          Spacer(),
          Column(
            crossAxisAlignment:
            CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text('\$'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey)),
                  Text(
                    state.maybeMap(loadSuccess:(state){
                      double balance=0;
                      for(var transaction in state.transactionData){
                        if(isInflow){
                          transaction.fold((_){}, (income){
                            if(income.date.month==DateTime.now().month){
                              balance+=income.amount.getOrCrash();
                            }
                          });

                        }else{
                          transaction.fold( (expense){
                            if(expense.date.month==DateTime.now().month){
                              balance+=expense.amount.getOrCrash();
                            }
                          },(_){},);
                        }
                      }
                      String rawBalance=balance.toInt().toString();
                      late String formattedBalance;
                      if(rawBalance.length==4){
                        formattedBalance = NumberFormat('#,###').format(balance.toInt());
                      }
                      else if(rawBalance.length==5){
                        formattedBalance = NumberFormat('##,###').format(balance.toInt());
                      }
                      else{
                        formattedBalance=rawBalance;
                      }
                      return formattedBalance;
                    },orElse: ()=>
                    '0',),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(children: [
                Visibility(visible:(isInflow?previousMonthIncome!=0:previousMonthExpense!=0),child: Text("${isInflow?incomePercentage.last:expensePercentage.last}%",style: TextStyle(color: isInflow?(incomePercentage.value1?Colors.green:Colors.red):(expensePercentage.value1?Colors.red:Colors.green),fontSize: 12),)),
                Text("${(isInflow?previousMonthIncome!=0:previousMonthExpense!=0)?"":"no data"} from the previous month",style: TextStyle(color: Colors.grey,fontSize: 12),)
              ],)
            ],
          ),
        ],),
      ),);
    },orElse: ()=>SizedBox());

  },
);
  }
}
