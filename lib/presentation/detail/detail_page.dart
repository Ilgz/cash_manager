import 'package:cash_manager/application/transaction/transaction_watcher/transaction_watcher_cubit.dart';
import 'package:cash_manager/domain/transaction/category.dart';
import 'package:cash_manager/domain/transaction/expense.dart';
import 'package:cash_manager/domain/transaction/income.dart';
import 'package:cash_manager/presentation/core/widgets/custom_scaffold.dart';
import 'package:cash_manager/presentation/detail/widgets/category_expense_stat.dart';
import 'package:cash_manager/presentation/detail/widgets/flow_card.dart';
import 'package:cash_manager/presentation/detail/widgets/horizontal_expense_chart.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              height: MediaQuery.of(context).size.height / 3,
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
                            child: IconButton(
                              onPressed: () {
                                context.pop();
                              },
                              icon: Icon(Icons.arrow_back_ios_outlined),
                              color: Colors.white,
                            ),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('total amount'.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('\$'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey)),
                                BlocBuilder<TransactionWatcherCubit,
                                    TransactionWatcherState>(
                                  builder: (context, state) {
                                    return Text(
                                      state.maybeMap(
                                        loadSuccess: (state) {
                                          double balance = 0;
                                          for (var transaction
                                              in state.transactionData) {
                                            transaction.fold(
                                                (expense) => balance -=
                                                    expense.amount.getOrCrash(),
                                                (income) => balance +=
                                                    income.amount.getOrCrash());
                                          }
                                          String rawBalance =
                                              balance.toInt().toString();
                                          late String formattedBalance;
                                          if (rawBalance.length == 4) {
                                            formattedBalance =
                                                NumberFormat('#,###')
                                                    .format(balance.toInt());
                                          } else if (rawBalance.length == 5) {
                                            formattedBalance =
                                                NumberFormat('##,###')
                                                    .format(balance.toInt());
                                          } else {
                                            formattedBalance = rawBalance;
                                          }
                                          return formattedBalance;
                                        },
                                        orElse: () => '0',
                                      ),
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
            top: MediaQuery.of(context).size.height / 3 - 80,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  FlowCard(
                    isInflow: true,
                  ),
                  FlowCard(
                    isInflow: false,
                  ),

                  BlocBuilder<TransactionWatcherCubit, TransactionWatcherState>(
                    builder: (context, state) {
                      return state.maybeMap(
                          loadSuccess: (state) {
                            List<Expense> expenseList = [];
                            for (Either<Expense, Income> item
                                in state.transactionData) {
                              if (item is Left<Expense, Income>) {
                                expenseList.add(item.value);
                              }
                            }
                            final top4Categories =
                                getTop4Categories(expenseList);
                            return top4Categories.isEmpty?SizedBox():Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Outflow detail",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                Text(
                                  "You can check where your money come and gone here",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                HorizontalExpenseChart(
                                    values: top4Categories.values.toList(),
                                    colors: top4Categories.keys
                                        .map((category) => category.color)
                                        .toList()),
                                SizedBox(height: 10,),
                                Row(children: [
                                  CategoryExpenseStat(index:0,length:top4Categories.length,top4Categories: top4Categories),
                                  CategoryExpenseStat(index:1,length:top4Categories.length,top4Categories: top4Categories)
                                ],),
                                SizedBox(height: 10),
                                Row(children: [
                                  CategoryExpenseStat(index:2,length:top4Categories.length,top4Categories: top4Categories),
                                  CategoryExpenseStat(index:3,length:top4Categories.length,top4Categories: top4Categories)
                                ],),
                              ],
                            );
                          },
                          orElse: () => SizedBox());
                    },
                  ),
                ],
              ),
            )),
      ],
    ));
  }
  Map<ExpenseCategory, int> getTop4Categories(List<Expense> expenses) {
    Map<int, int> categoryTotals = {};

    // Calculate the total amount for each category
    for (var expense in expenses) {
      int category = expense.category;
      int amount = expense.amount.getOrCrash().toInt();
      if (categoryTotals.containsKey(category)) {
        categoryTotals[category] = categoryTotals[category]! + amount;
      } else {
        categoryTotals[category] = amount;
      }
    }

    // Sort the categories by total amount
    List<MapEntry<int, int>> sortedCategories = categoryTotals.entries.toList()
      ..sort((a, b) => b.value - a.value);

    // Take the top 4 categories
    Map<ExpenseCategory, int> top4Categories = {};
    for (int i = 0; i < sortedCategories.length && i < 4; i++) {
      int category = sortedCategories[i].key;
      int totalAmount = sortedCategories[i].value;
      ExpenseCategory categoryName = Expense.categories[category];
      top4Categories[categoryName] = totalAmount;
    }

    return top4Categories;
  }
}


