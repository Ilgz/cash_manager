import 'package:cash_manager/application/transaction/transaction_filter/transaction_filter_cubit.dart';
import 'package:cash_manager/application/transaction/transaction_watcher/transaction_watcher_cubit.dart';
import 'package:cash_manager/domain/transaction/category.dart';
import 'package:cash_manager/domain/transaction/expense.dart';
import 'package:cash_manager/domain/transaction/income.dart';
import 'package:cash_manager/presentation/core/constants.dart';
import 'package:cash_manager/presentation/core/widgets/critical_failure_card.dart';
import 'package:cash_manager/presentation/core/widgets/custom_progress_indicator.dart';
import 'package:cash_manager/presentation/core/widgets/custom_scaffold.dart';
import 'package:cash_manager/presentation/detail/widgets/flow_card.dart';
import 'package:cash_manager/presentation/transaction/expense/expense_page.dart';
import 'package:cash_manager/presentation/transaction/income/income_page.dart';
import 'package:cash_manager/presentation/transaction/widgets/income_expense_chart.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height/3,
                  color: Color(0xff0039a5),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: IconButton(onPressed: (){
                                  context.pop();
                                  }, icon: Icon(Icons.arrow_back_ios_outlined),color: Colors.white,),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "Details",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Expanded(child: SizedBox())
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: Color(0xff00b5e6),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.account_balance_wallet_outlined,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text('total amount'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey)),
                                Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text('\$'.toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey)),
                                    BlocBuilder<TransactionWatcherCubit, TransactionWatcherState>(
                                      builder: (context, state) {
                                        return Text(
                                          state.maybeMap(loadSuccess:(state){
                                            double balance=0;
                                            for(var transaction in state.transactionData){
                                              transaction.fold((expense) => balance-=expense.amount.getOrCrash(), (income) => balance+=income.amount.getOrCrash());
                                            }
                                            String rawBalance=balance.toInt().toString();
                                            late String formattedBalance;
                                            if(rawBalance.length==4){
                                              print(rawBalance);
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
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                )),
            Positioned(
                top: MediaQuery.of(context).size.height/3-80,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlowCard(isInflow: true,)
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: FlowCard(isInflow: false,)
                    ),

                  ],
                )),
          ],
        ));
  }
}

